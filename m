Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LIS7C-0001Zb-VJ
	for openembedded-devel@openembedded.org; Thu, 01 Jan 2009 19:17:51 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LIS1i-0002Ou-NR
	for openembedded-devel@openembedded.org; Thu, 01 Jan 2009 18:12:10 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 01 Jan 2009 18:12:10 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 01 Jan 2009 18:12:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 01 Jan 2009 19:11:57 +0100
Message-ID: <gjj11d$3ne$1@ger.gmane.org>
References: <1230827114.5320.42.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081217 Shredder/3.0b2pre
In-Reply-To: <1230827114.5320.42.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: "Virtual" native and sdk recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Jan 2009 18:17:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-01-09 17:25, Richard Purdie wrote:
> Its nice to try something a bit different occasionally. For a long time
> the mechanical repetitive nature of -native and -sdk recipes has
> bothered me and people have talked about getting rid of them since
> forever. I've had ideas floating around on how to address this for a
> while and I now have a proper proposal and better still a proof of
> concept.
>
> Some -native recipes are already very simple, others are quite complex.
> My hypothetical foo package files contain some common constructs and
> look like:
>
> foo/foo.inc:
>
> SRC_URI = "http://somwehere/foo-${PV}.tar.bz2 \
>             file://some.patch;patch=1"
> S = "${WORKDIR}/foo-${PV}
> inherit autotools
>
> foo/foo_1.0.bb:
>
> require foo.inc
>
> foo/foo-native_1.0.bb:
> require foo_${PV}.bb
> FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/foo-${PV}"
> inherit native
>
> and foo/foo-1.0/some.patch exists.
>
>
> Proposal Step A:
>
> Having to set:
>
> FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/foo-${PV}"
>
> and
>
> S = "${WORKDIR}/foo-${PV}
>
> is fairly pointless and it would be nice the the defaults just did the
> right thing.
>
> http://git.pokylinux.org/cgit.cgi/poky/commit/?h=experimental-virtualnative&id=b8f0510a5567f6d1b90934fe513fd40423f11086
>
> is a patch introducing BASEPN which is PN with a range of specified
> suffixes removed (-native, -cross-sdk, -cross, -sdk as specified by
> SPECIAL_PKGSUFFIX).


How is the above different from the BPN used in OE?

# Base package name
# Automatically derives "foo" from "foo-native", "foo-cross" or 
"foo-initial"
# otherwise it is the same as PN and P
BPN = "${@base_package_name(d)}"
BP = "${BPN}-${PV}"

[..]

S = "${WORKDIR}/${BP}"
B = "${S}"

regards,

Koen




>
> FILESPATH and S can then be constructed with BASEPN instead of PN
> removing the need to need to hardcode them:
>
> http://git.pokylinux.org/cgit.cgi/poky/commit/?h=experimental-virtualnative&id=ed829661d51b8f23628e97404ed507c2e56d8495
>
> This reduces my hypothetical example to:
>
> foo/foo.inc:
>
> SRC_URI = "http://somwehere/${BASEPN}-${PV}.tar.bz2 \
>             file://some.patch;patch=1"
> inherit autotools
>
> foo/foo-native_1.0.bb:
> require foo_${PV}.bb
> inherit native
>
> The above proposal is worthwhile in itself alone.
>
>
> Proposal Step B:
>
> To add a new variable which is a list of classes to additionally parse
> after parsing the 'base' recipe. In the above example, foo-native-1.0.bb
> would be removed and we'd instead have:
>
> foo/foo.inc:
>
> SRC_URI = "http://somwehere/${BASEPN}-${PV}.tar.bz2 \
>             file://some.patch;patch=1"
> inherit autotools
> BBCLASSEXTEND = "native"
>
> Internally bitbake would see BBCLASSEXTEND and do something like:
>
> """
> cls = value in BBCLASSEXTEND
> data.setVar('PN', pn + '-' + cls, based)
> inherit cls
> """
>
> The big change here is that one .bb file can now provide multiple
> targets. This causes a few issues but as a hacked up proof of concept:
>
> http://git.pokylinux.org/cgit.cgi/poky/commit/?h=experimental-virtualnative&id=f614d1e2ff10938167ba6c29c49677a03b4a19ef
>
> where we append magic values to the "filename" and inherit the
> appropriate class when we notice the special names.
>
>
> The advantages of doing this are:
>
> * We can convert to the system incrementally
> * Simple syntax, the complexity is hidden in bitbake
> * Removes needless duplication but allows custom -native and -sdk
>    packages to be used where automation isn't possible/desirable
> * Parsing speed should increase since the number of full recipes we
>    parse drops and only the end stage of parsing is done for the
>    BBCLASSEXTEND packages.
> * Even just step A simplifies recipes.
>
> The disadvantages:
>
> * More complexity in bitbake (but localised mainly to cache.py)
> * The .bb file is no longer one recipe but can run in different
>    flavours which will be confusing to people
> * Would require a new bitbake release and adoption of that release
>    before OE.dev can use step B functionality. Step A functionality
>    could be added without a new bitbake by putting the special function
>    in base.bbclass instead of bitbake.
> * Certain recipe name extensions become "special". The values are not
>    hardcoded in bitbake though and its already a common convention so
>    I'm not sure this is a problem.
>
>
> I've shared my changes in a branch of Poky:
>
> http://git.pokylinux.org/cgit.cgi/poky/log/?h=experimental-virtualnative
>
> Obviously there are some heavy cleanups needed to the last bitbake
> changes but it works as a proof of concept so its time to discuss it.
>
> The main problem I currently have before being able to deploy this more
> widely is auto adjustment of DEPENDS. In most cases this consists of
> adding "-native" or "-sdk" to the values already in DEPENDS so we could
> probably add a function to native.bbclass for that. Alternatively or
> additionally, I'm considering having native.bbclass append to OVERRIDES
> so we can override DEPENDS that way instead.
>
> Comments welcome.
>
> Cheers,
>
> Richard
>




