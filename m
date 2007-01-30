Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>)
	id 1HBpdb-0006OK-6W; Tue, 30 Jan 2007 10:50:54 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 7CA3E28C012; Tue, 30 Jan 2007 10:46:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7 (2006-10-05) on srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7
Received: from [192.168.2.128] (e180173175.adsl.alicedsl.de [85.180.173.175])
	by srv043.dedi23.de (Postfix) with ESMTP id 3312228C011;
	Tue, 30 Jan 2007 10:46:02 +0100 (CET)
Date: Tue, 30 Jan 2007 10:48:45 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.95.6) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <136216082.20070130104845@vanille-media.de>
To: "pb commit" <openembedded-commits@lists.openembedded.org>
In-Reply-To: <E1HBTcw-0006py-Gd@linuxtogo.org>
References: <E1HBTcw-0006py-Gd@linuxtogo.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev package.bbclass: add workaround for wrongly globbed symlinks in FILES causing python
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
X-List-Received-Date: Tue, 30 Jan 2007 09:51:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

pb commit wrote:
> package.bbclass: add workaround for wrongly globbed symlinks in FILES causing python
> traceback spew during population

> Author: pb@openembedded.org
> Branch: org.openembedded.dev
> Revision: 77212e456a021803396d11bcad7616c51e5c6d25
> ViewMTN:
> http://monotone.openembedded.org/revision.psp?id=77212e456a021803396d11bcad7616c51e5c6d25
> Files:
> 1
> classes/package.bbclass
> Diffs:

> #
> # mt diff -r4babe1caf820e719d27c7ed13d9518351ba729f3
> -r77212e456a021803396d11bcad7616c51e5c6d25
> #
> # 
> # 
> # patch "classes/package.bbclass"
> #  from [edf00c41e2683d3180be274fedde142ed3837c83]
> #    to [4c30e72ec3dcec6b3bddaaa4e5dc3cb458993749]
> # 
> ============================================================
> --- classes/package.bbclass    
> edf00c41e2683d3180be274fedde142ed3837c83
> +++ classes/package.bbclass    
> 4c30e72ec3dcec6b3bddaaa4e5dc3cb458993749
> @@ -408,11 +408,16 @@ python populate_packages () {
>                         fpath = os.path.join(root,file)
>                         dpath = os.path.dirname(fpath)
>                         bb.mkdirhier(dpath)
> +                       if file in cleandirs:
> +                               cleandirs.remove(file)
>                         ret = bb.movefile(file,fpath)
>                         if ret is None or ret == 0:
>                                 raise bb.build.FuncFailed("File population failed")
>                 for dir in cleandirs:
> -                       os.rmdir(dir)
> +                       if os.path.isdir(dir):
> +                               os.rmdir(dir)
> +                       else:
> +                               bb.note("ERROR: directory %s went
> away unexpectedly during package population" % dir)
>                 del localdata
>         os.chdir(workdir)
>  

This seems break with base-files:

NOTE: package base-files-3.0.14-r58: task do_package: started
ERROR: Error in executing: /home/stefan/Projekte/OpenEZX/oe/org.openembedded.dev/packages/base-files/base-files_3.0.14.bb
ERROR: Exception:exceptions.OSError Message:[Errno 22] Invalid argument: './'
ERROR: Printing the environment of the function
ERROR:  0113:                   if ret is None or ret == 0:
ERROR:  0114:                           raise bb.build.FuncFailed("File population failed")
ERROR:  0115:           for dir in cleandirs:
ERROR:  0116:                   if os.path.isdir(dir):
ERROR:  0117:                           os.rmdir(dir)
ERROR:  0118:                   else:
ERROR:  0119:                           bb.note("ERROR: directory %s went away unexpectedly during package population" % dir)
ERROR:  0120:           del localdata
ERROR:  0121:   os.chdir(workdir)
ERROR: Error in executing: /home/stefan/Projekte/OpenEZX/oe/org.openembedded.dev/packages/base-files/base-files_3.0.14.bb
ERROR: Exception:exceptions.OSError Message:[Errno 22] Invalid argument: './'


Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



