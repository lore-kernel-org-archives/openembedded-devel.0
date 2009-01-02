Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LIjh4-0003i4-Vd
	for openembedded-devel@openembedded.org; Fri, 02 Jan 2009 14:04:03 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LIjbZ-0004ML-5f
	for openembedded-devel@openembedded.org; Fri, 02 Jan 2009 12:58:21 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 02 Jan 2009 12:58:21 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 02 Jan 2009 12:58:21 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 02 Jan 2009 13:58:10 +0100
Message-ID: <gjl314$hhq$1@ger.gmane.org>
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
X-List-Received-Date: Fri, 02 Jan 2009 13:04:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-01-09 17:25, Richard Purdie wrote:

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

[..]

> The disadvantages:
>
> * More complexity in bitbake (but localised mainly to cache.py)
> * The .bb file is no longer one recipe but can run in different
>    flavours which will be confusing to people
> * Would require a new bitbake release and adoption of that release
>    before OE.dev can use step B functionality. Step A functionality
>    could be added without a new bitbake by putting the special function
>    in base.bbclass instead of bitbake.

If you put that code into bitbake trunk *now* and do a new release in a 
week or so people can start testing your work. OE .dev can require that 
bitbake release when the branch with BBCLASSEXTEND lands.
The important part is that bitbake has BBCLASSEXTEND in a release real 
soon :)

regards,

Koen



