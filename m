Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L8Cqm-0005Rv-I1
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 12:58:32 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L8CnI-0001Gv-MS
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 11:54:56 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 11:54:56 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 11:54:56 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 04 Dec 2008 12:54:49 +0100
Message-ID: <gh8ge9$gff$1@ger.gmane.org>
References: <1228384295.14968.63.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081125 Shredder/3.0b1pre
In-Reply-To: <1228384295.14968.63.camel@hammer.suse.cz>
Sender: news <news@ger.gmane.org>
Subject: Re: broken shared-mime-info and MIME typing
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
X-List-Received-Date: Thu, 04 Dec 2008 11:58:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-12-08 10:51, Stanislav Brabec wrote:
> Looking at MIME binding, I found that it is now completely broken.
>
> We have mime.class, that provides install-time generating of the
> database.
>
> shared-mime-info attempts to provide compile-time generating of the
> database. As it does not contain freedesktop.org.xml, any package using
> mime.class calling update-mime-database will remove 99% of entries in
> the MIME database.
>
> Creating database during the build time is not possible yet and would
> require significant changes in update-mime-database (or writing a
> different tool):
> There is no way to create /usr/share/mime/magic, subclasses, mime.cache
> during the build time =>  it must be done during installation. Note that
> mime.cache is a binary file.
>
>
> Proposal:
>
> - Install freedesktop.org.xml again.
> - Change mime.class:
>    - Change scripts: First test, whether update-mime-database is
>      installed, if yes, then call it.
>    - mime class should not RDEPEND on shared-mime-info (now it depends,
>      but it is missing there and may cause installation errors)
>    - mime_prerm should be probably postrm =>  update database after
>      package removal
> - default to --disable-update-mimedb

The current implementation is:

* shared-mime-info does *NOT* include freedesktop.org.xml to save space
* mime.bbclass *DOES* check for /usr/bin/update-mime-info
* mime.bbclass *DOES* add rdepends to freedesktop.org.xml when needed

This means that people not needing freedesktop.org.xml don't get it 
installed and people that do need it get it installed automagically when 
using mime.bbclass

regards,

Koen


>
> Alternatives:
>
> - Write update-mime-database alternative capable to build magic without
>    freedesktop.org.xml.
> - Patch update-mime-database to allow compressed packages/*.xml.
> - Return to compile time and write a tool capable to create MIME
>    database for all packages available in the feed as the part of
>    package-index creation. It would need a special XDG_* variables
>    settings, so applications will be able to collect magic from all
>    repositories.
>




