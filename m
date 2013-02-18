Received: from mail-bk0-f41.google.com ([209.85.214.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1U7Skf-0003KM-M9
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Feb 2013 16:35:34 +0100
Received: by mail-bk0-f41.google.com with SMTP id q16so2582556bkw.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 07:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=1DFLnl3NKusPQl2wwCnOhzGvBD/UkHUnQzeJY7Gxm3I=;
	b=goSp+lvLIm24M2ZErGdUV2EzR+JutAh5f9SYv2Q9zEvYtx3KSH+zFTqjoN/nsKmoHZ
	CAtjFGHre0PmzheqI0viBTlNVXSCxsbB2uq4dGGctyy9PfZWPnhhydNidremZNKlgOQv
	3OiCEusrDWgHrk1cE4U3S9/M4BfuHvGBp/MwXF7zOW4QnajToub/6H2pAlHx5Tf2mggB
	EUBSUQaWkAPnXWDLY60bVDR0tWOZoqlZSBdy4N81ZC/zD5vQ7UW+rULU883az5Epp+KT
	46cSeiKiVPvQI4XrtdOOlYR4S3/NsRBd0RAApoWDIS+XmRrUQ7Sf6Nd/uylLl3XT6/EP
	/q8Q==
X-Received: by 10.204.128.151 with SMTP id k23mr4818014bks.65.1361200765645;
	Mon, 18 Feb 2013 07:19:25 -0800 (PST)
MIME-Version: 1.0
Sender: takeshi.ken.hamasaki@gmail.com
Received: by 10.204.25.141 with HTTP; Mon, 18 Feb 2013 07:19:04 -0800 (PST)
In-Reply-To: <5121F224.4080906@nedap.com>
References: <511E373D.1070109@nedap.com>
	<CAPESJy6N4oTvAz9GBLN29UBZ=i1CgfKJ5DOQv3R6BS18AABe1Q@mail.gmail.com>
	<5121F224.4080906@nedap.com>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
Date: Tue, 19 Feb 2013 00:19:04 +0900
X-Google-Sender-Auth: EHGhPX6NgMCFavF9sPJrpdIRaFg
Message-ID: <CAPESJy4eKSJq3VMtTKDDsYaR+0s=pAk+4kASqT74WzS2xQrVDg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: opkg-make-index not found
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
X-List-Received-Date: Mon, 18 Feb 2013 15:35:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

this may or may not help you:

$ bitbake -e package-index > bbenv.package-index
$ grep PACKAGEINDEXES bbenv.package-index
(
 for me, the result was:

 # PACKAGEINDEXES= package_update_index_ipk;
 PACKAGEINDEXES="package_update_index_ipk;"

)

Then I tried searching "package_update_index_ipk" in bbenv.package-index
using a text editor. It is a function, and in it, opkg-make-index
is called in a line:

 flock $pkgdir/Packages.flock -c "opkg-make-index -r $pkgdir/Packages
-p $pkgdir/Packages -m $pkgdir/"

What do you find in your box?

-- 
Takeshi Hamasaki

2013/2/18 Jaap de Jong <jaap.dejong@nedap.com>:
>
> On 02/16/2013 07:51 AM, Takeshi Hamasaki wrote:
>
>>> if I do
>>>
>>>      bitbake package-index
>>>
>>> it crashes with the message
>>>
>>>      | /bin/bash: opkg-make-index: command not found
>>>
>>> This is on a 64 debian machine, possibly the wrong path is searched?
>>> (there is a opkg-make-index under sysroots/x86_64-linux/usr/bin)
>>>
>>>
>
>> If you doubt the PATH setting, you should check the output from:
>> $ bitbake -e | grep '^export PATH'
>>
>
> Well opkg-make-index is in the path.
>
> Something strange is happening here.
> If I edit package-index.bb and add a call to opkg-make-index
>
>    do_package_index() {
>         set -ex
>    opkg-make-index   ### ADDED CODE
>         ${PACKAGEINDEXES}
>         set +ex
>    }
>
>
> it shows an error message when invoking bitbake package-index showing that
> opkg-make-index is actualy working...
>
>    ///
>
> .../build/tmp-angstrom_v2012_05-eglibc/sysroots/x86_64-linux/usr/bin/opkg-make-index
>    [-h] [-s] [-m] [-l Packages.filelist] [-p Packages] [-r
>    Packages.old] [-L localesdir] [-v] packagesdir
>    NOTE: package package-index-1.0-r0: task do_package_index: Failed
>    ///
>
> Any idea?
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


