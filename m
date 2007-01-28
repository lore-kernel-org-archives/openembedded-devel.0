Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1HBICb-0004bq-8n
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Jan 2007 23:08:45 +0100
Received: from cpc2-cmbg6-0-0-cust429.cmbg.cable.ntl.com ([81.107.33.174]
	helo=[192.168.2.189])
	by crown.reciva.com with esmtpsa (TLS-1.0:RSA_ARCFOUR_MD5:16)
	(Exim 4.50) id 1HBICX-0007p8-7C; Sun, 28 Jan 2007 22:08:41 +0000
From: Phil Blundell <pb@reciva.com>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <492827442.20070128233041@gmail.com>
References: <E1HBHQ2-0002RA-CZ@linuxtogo.org>
	<492827442.20070128233041@gmail.com>
Date: Sun, 28 Jan 2007 22:09:52 +0000
Message-Id: <1170022193.4354.0.camel@mebius.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev package.bbclass: remove	directories named in FILES from image after file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Jan 2007 22:08:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

There shouldn't be any non-empty dirs.  If you're encountering some,
that must be a bug.  Do you have a testcase?

p.

On Sun, 2007-01-28 at 23:30 +0200, Paul Sokolovsky wrote:
> Hello Phil,
> 
>       What's the idea behind this change? How would if handle non-empty
> dirs?
> 
> 
> This is a forwarded message
> From: pb commit <openembedded-commits@lists.openembedded.org>
> To: openembedded-commits@lists.openembedded.org
> Date: Sunday, January 28, 2007, 11:18:34 PM
> Subject: [oe-commits] org.oe.dev package.bbclass: remove directories named in FILES from image after file
> 
> ===8<==============Original message text===============
> package.bbclass: remove directories named in FILES from image after file 
> migration
> 
> Author: pb@openembedded.org
> Branch: org.openembedded.dev
> Revision: e03e452c09311f78ce177e8febeb9963f30bc1ef
> ViewMTN: http://monotone.openembedded.org/revision.psp?id=e03e452c09311f78ce177e8febeb9963f30bc1ef
> Files:
> 1
> classes/package.bbclass
> Diffs:
> 
> #
> # mt diff -r27b46e6b2f1768296232a9d2ce04946cd1d5514e -re03e452c09311f78ce177e8febeb9963f30bc1ef
> #
> # 
> # 
> # patch "classes/package.bbclass"
> #  from [e59caa16e5f65d4574477c54a942e64e26296223]
> #    to [edf00c41e2683d3180be274fedde142ed3837c83]
> # 
> ============================================================
> --- classes/package.bbclass     e59caa16e5f65d4574477c54a942e64e26296223
> +++ classes/package.bbclass     edf00c41e2683d3180be274fedde142ed3837c83
> @@ -387,6 +387,7 @@ python populate_packages () {
>                 bb.mkdirhier(root)
>                 filesvar = bb.data.getVar('FILES', localdata, 1) or ""
>                 files = filesvar.split()
> +               cleandirs = []
>                 for file in files:
>                         if os.path.isabs(file):
>                                 file = '.' + file
> @@ -395,6 +396,7 @@ python populate_packages () {
>                                         newfiles =  [ os.path.join(file,x) for x in os.listdir(file) ]
>                                         if newfiles:
>                                                 files += newfiles
> +                                               cleandirs = [file] + cleandirs
>                                                 continue
>                         globbed = glob.glob(file)
>                         if globbed:
> @@ -409,6 +411,8 @@ python populate_packages () {
>                         ret = bb.movefile(file,fpath)
>                         if ret is None or ret == 0:
>                                 raise bb.build.FuncFailed("File population failed")
> +               for dir in cleandirs:
> +                       os.rmdir(dir)
>                 del localdata
>         os.chdir(workdir)
>  
> 
> 
> 
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
> 
> ===8<===========End of original message text===========
> 
> 
> 



