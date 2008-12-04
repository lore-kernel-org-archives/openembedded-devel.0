Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L8GS7-0002q7-9D
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 16:49:19 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L8GOb-0001lm-36
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 15:45:41 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 15:45:41 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 15:45:41 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 04 Dec 2008 16:45:29 +0100
Message-ID: <gh8tup$11g$1@ger.gmane.org>
References: <1228384295.14968.63.camel@hammer.suse.cz>	<gh8ge9$gff$1@ger.gmane.org>	<1228396188.14968.188.camel@hammer.suse.cz>	<AC214253-0411-451F-9A25-04D0F6174B90@student.utwente.nl>
	<1228404803.14968.296.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081125 Shredder/3.0b1pre
In-Reply-To: <1228404803.14968.296.camel@hammer.suse.cz>
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
X-List-Received-Date: Thu, 04 Dec 2008 15:49:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-12-08 16:33, Stanislav Brabec wrote:
> Koen Kooi wrote:
>
>>> This would not work. Without freedesktop.org.xml the command
>>> "update-mime-database /usr/share/mime" will ruin the database.
>> That does work, had you looked a bit better:
>>
>> mime.bbclass does:
>> 		rdepends.append("freedesktop-mime-info")
>
> My mistake, NOTE says different. But problem 1 is still valid for manual
> calling of "update-mime-database /usr/share/mime" on a system, that does
> not have freedesktop-mime-info.
>
> 2., 3. and 4. were just a suggestions, 5. is a minor issue.
>
> See attached patch (untested), which should do 2., 3. and 4.
> Issue 5 fix is not done yet.
>
>> I tested it on 2 devices and it does the right thing:
>> freedesktop.org.xml gets installed before the update-mime-database
>> command is run.
>
> Yes, it works for packages. Actually users of locales will get
> freedesktop-mime-info automatically due to 5.
>
> diff --git a/classes/mime.bbclass b/classes/mime.bbclass
> index a214c11..75c1db9 100644
> --- a/classes/mime.bbclass
> +++ b/classes/mime.bbclass
> @@ -5,9 +5,6 @@ if [ "$1" = configure ]; then
>   	if [ -x ${bindir}/update-mime-database ] ; then
>   		echo "Updating MIME database... this may take a while."
>   		update-mime-database $D${datadir}/mime
> -	else
> -		echo "Missing ${bindir}/update-mime-database, update of mime database failed!"
> -		exit 1
>   	fi
>   fi
>   }
> @@ -17,9 +14,6 @@ if [ "$1" = remove ] || [ "$1" = upgrade ]; then
>   	if [ -x ${bindir}/update-mime-database ] ; then
>   		echo "Updating MIME database... this may take a while."
>   		update-mime-database $D${datadir}/mime
> -	else
> -		echo "Missing ${bindir}/update-mime-database, update of mime database failed!"
> -		exit 1
>   	fi
>   fi
>   }

You want it to error out of u-m-d is not found, since the purpose of the 
postinst (updating the database) couldn't be done. Do you have a 
use-case for this non-error behaviour?


> @@ -50,7 +44,9 @@ python populate_packages_append () {
>   			postrm += bb.data.getVar('mime_postrm', d, 1)
>   			bb.data.setVar('pkg_postrm_%s' % pkg, postrm, d)
>   			bb.note("adding shared-mime-info dependency to %s" % pkg)
> -			rdepends = explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 0) or bb.data.getVar('RDEPENDS', d, 0) or "")
> -			rdepends.append("freedesktop-mime-info")
> -			bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
> +			rrecommends = explode_deps(bb.data.getVar('RRECOMMENDS_' + pkg, d, 0) or bb.data.getVar('RRECOMMENDS', d, 0) or "")
> +			rrecommends.append("freedesktop-mime-info")
> +			bb.data.setVar('RRECOMMENDS_' + pkg, " " + " ".join(rrecommends), d)

I'm not sure what the above accomplished, apart from making it easier to 
shoot yourself in the foot. What's the usecase for allowing to install 
the xml files, but not the update tool (assuming you applied the changes 
below)?

> +FILES_${PN} += "${datadir}/mime/packages"

I'm not so sure on that one, but I guess recipes can put the package 
theu want the xml file in before ${PN} in PACKAGES


> diff --git a/packages/shared-mime-info/shared-mime-info_0.51.bb b/packages/shared-mime-info/shared-mime-info_0.51.bb
> index 31a7df1..cb1f329 100644
> --- a/packages/shared-mime-info/shared-mime-info_0.51.bb
> +++ b/packages/shared-mime-info/shared-mime-info_0.51.bb
> @@ -10,6 +10,6 @@ do_install_append() {
>   # freedesktop.org.xml is huge and only needed when updating the db
>   # mime.bbclass will add the dependency on it automagically
>   PACKAGES =+ "freedesktop-mime-info"
> -FILES_freedesktop-mime-info = "${datadir}/mime/packages/freedesktop.org.xml"
> +FILES_freedesktop-mime-info = "${datadir}/mime/packages/freedesktop.org.xml ${bindir}/update-mime-database"
>   RDEPENDS_freedesktop-mime-info = "shared-mime-info"

If you're going to package those together you should name the package 
'update-mime-database' to avoid confusion when people want to install 
the utils and do 'opkg list | grep mime'.

regards,

Koen



