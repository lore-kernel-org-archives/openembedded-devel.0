Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LRsmS-0006mg-J5
	for openembedded-devel@openembedded.org; Tue, 27 Jan 2009 19:35:24 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LRsfA-0001C4-MJ
	for openembedded-devel@openembedded.org; Tue, 27 Jan 2009 18:27:52 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 27 Jan 2009 18:27:52 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 27 Jan 2009 18:27:52 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 27 Jan 2009 19:27:43 +0100
Message-ID: <glnjmv$kuc$1@ger.gmane.org>
References: <497EEAE6.7090904@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090118 Shredder/3.0b2pre
In-Reply-To: <497EEAE6.7090904@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: thinking about DEPENDS properties
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
X-List-Received-Date: Tue, 27 Jan 2009 18:35:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-01-09 12:07, Robert Schuster wrote:
> Hi,
> today I was thinking about some missing semantics in OE's DEPENDS
> variable and had the idea of reusing the way we write SRC_URI entries
> for them.
>
> The issues:
>
> 1) Strong dependencies
>
> Some recipes have a strong dependency on another recipe. Take llvm as an
> example. llvm puts a bunch of static libraries (.a) and object code
> files into staging which another program links to. So, if llvm is
> recompiled (e.g. changed CFLAGS or applied a patch) those having a
> dependency on llvm should be recompiled as well.

Isn't that what BB_STAMP_POLICY=whitelist and BB_STAMP_POLICY=full 
accomplish?

regards,

Koen


>
> In order to express this, I would write:
>
> DEPENDS += "llvm;strong=true"
>
> 2) Minimum&  Maximum supported versions
> Some recipes cannot be built with certain versions of other recipes.
>
> DEPENDS += "automake-native;minver=1.10"
>
> If the distro uses a lower automake version OE should error out when
> someone tries to build that recipe:
>
> ERROR: Recipe 'foo' needs at least 'automake-native 1.10' but
> 'PREFERRED_VERSION_automake-native' is set to '1.9.6'.
>
> --
>
> I know this brings in a lot of complicated things to think about, e.g.
> what is the result of:
>
> foo.inc: DEPENDS = "bar;minver=0.8;maxver=0.9"
>
> foo_1.0: require foo.inc
>           DEPENDS += "bar;minver=1.0"
>
> Perhaps to many components in OE already expect DEPENDS to be a
> whitespace separated list of words and we should be add another variable
> whose only purpose is to set properties for existing DEPENDS entries:
>
>
> foo_1.0:
>   require foo.inc
>   # Replaces value from foo.inc
>   DEPENDSPROPS = "bar;minver=1.0"
>
> --
>
> My main concern is that the knowledge about which recipe can live in
> harmony with another is currently implicit. There is no way to express
> this except by writing a comment (which is almost never done).
>
> Regards
> Robert
>
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




