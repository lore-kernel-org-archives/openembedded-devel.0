Received: from mail2.multitech.net ([65.126.90.254] helo=mail2.multitech.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jgilles@multitech.com>) id 1QqVG6-0004Vb-35
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Aug 2011 21:13:06 +0200
Received: from mail2.multitech.com (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id
	676925AF299_E403435B for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2011 19:08:37 +0000 (GMT)
Received: from mail.multitech.com (mtsexchange.dc.multitech.prv
	[192.168.11.244])
	by mail2.multitech.com (Sophos Email Appliance) with ESMTP id
	C89E5583598_E403434F for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2011 19:08:36 +0000 (GMT)
X-Ninja-PIM: Scanned by Ninja
X-Ninja-AttachmentFiltering: (no action)
Received: from [192.168.52.113] ([192.168.52.113]) by mail.multitech.com with
	Microsoft SMTPSVC(5.0.2195.7381); Mon, 8 Aug 2011 14:07:57 -0500
From: Jesse Gilles <jgilles@multitech.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAFu+nvEwGYd-t6n04yn41wd50+5zPoEu=5WVYxOmaWLDdyKdEQ@mail.gmail.com>
References: <CAFu+nvEwf_hPbB0a21qJFWAHZqdCkb3MPaKaZcLFgD+xc7cGVw@mail.gmail.com>
	<4E15F6DD.2020308@mentor.com> <1312553761.14079.22.camel@jjg-linux>
	<CAFu+nvE3v+VswNB-3ZwF3dFMa42wgeSv6GMBJ4C=bYNpWKKFmw@mail.gmail.com>
	<20110805151726.GB15632@rhein.zuhause.netz>
	<CAFu+nvEwGYd-t6n04yn41wd50+5zPoEu=5WVYxOmaWLDdyKdEQ@mail.gmail.com>
Date: Mon, 08 Aug 2011 14:08:35 -0500
Message-ID: <1312830515.683.29.camel@jjg-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-OriginalArrivalTime: 08 Aug 2011 19:07:57.0841 (UTC)
	FILETIME=[7C107810:01CC55FE]
Subject: Re: classpath in 2011.03-maintenance
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
X-List-Received-Date: Mon, 08 Aug 2011 19:13:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-05 at 11:38 -0400, George C. Huntington, III wrote:
> I posted a patch that makes the wrapper script return the error code
> if it
> fails after 5 retries.  it is on patchwork.
> http://patches.openembedded.org/patch/7249/

It seems like saving the javac script arguments into the ARGS variable
is what broke the old behavior where -bootclasspath '' worked for
building classpath.  Putting that part of the script back to the way it
used to be fixes it.

Do you want to merge this in with your error code return patch?

--- a/recipes/ecj/files/ecj.in
+++ b/recipes/ecj/files/ecj.in
@@ -1,13 +1,16 @@
-ARGS=${1+"$@"}
 COUNT=5
 END=0
+RETURNCODE=0

 while test "${COUNT}" -gt "${END}"
 do
- ${RUNTIME} -Xmx1024m -cp ${ECJ_JAR} org.eclipse.jdt.internal.compiler.batch.Main ${ARGS}
+ ${RUNTIME} -Xmx1024m -cp ${ECJ_JAR} org.eclipse.jdt.internal.compiler.batch.Main ${1+"$@"}
+ RETURNCODE=${?}
  if test "${?}" -eq "${END}"
  then
     break
  fi
  COUNT=$(($COUNT-1))
 done
+
+exit ${RETURNCODE}

Otherwise, I can submit it as another patch, but it will depend on yours...

Thanks,
Jesse



