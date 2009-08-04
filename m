Received: from [209.85.218.221] (helo=mail-bw0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1MYKWt-000325-AX
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Aug 2009 15:58:15 +0200
Received: by bwz21 with SMTP id 21so2972299bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Aug 2009 06:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=FY1KVcV/MtDrecz/gheeHW4evM5sec2ekq5Sv6vFhFI=;
	b=epVOP9iax/FHJ+gzXAx/GngzKSG+R2DjAXrCoMCLsJES93yo7oauOCdMRn8dj+8r7p
	1cUD12CMOl8UxOcosA1ZObmo1LFBwiLewUr2CrvWuP/CXzjeaTGEHdketgul8JtMcAxH
	d0M0tv1a3hXw7Lb6O6eM+6BZ39H4tJa9OedlY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=fx9wsSt2QUtTVEPqLrt1RmCg6La6g2ZyoWyuOMjTbi+Ie4RXfbJSBfD0yFRseb5Bxc
	6ZhMjrSv/wgJcFY5hZmIAGj0cKEgKT3X1DPgckWTrJYaN3BewF5v/RHAd8t62/O771AR
	nxCiRTvjfbHeVwjJCHH69hMSfqy23Tknog2gs=
MIME-Version: 1.0
Received: by 10.204.60.133 with SMTP id p5mr6699425bkh.143.1249393360663; Tue, 
	04 Aug 2009 06:42:40 -0700 (PDT)
Date: Tue, 4 Aug 2009 14:42:40 +0100
Message-ID: <91283b620908040642t174a21baif74f986ff3b00f7c@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Trying to build a console image with qt4-embedded without gles being included
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
X-List-Received-Date: Tue, 04 Aug 2009 13:58:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I am trying to build an image with qt4 embedded support. Using recipe qt4/
qt4-embedded_4.5.2.bb as I have no graphics capabilities on my target
hardware I do not want to include open GL (gles).

Can anyone tell me how I achieve this as each time I build it is using the
recipe qt4/qt4-embedded-gles_4.5.2.bb.

I have tried to rebuild using -c clean and -c rebuild. Then deleting all qt4
directories from my tmp/work folder to force the rebuild of the code. Each
time it comes back to build gles.

I have deleted my tmp directory and started the build from scratch, but if
anyone has any suggestions I'd really appreciate it. Already the nummber of
tasks has greatly reduced after deleting tmp and starting the build again.

Why is this? Is there something within tmp that can be deleted to ensure
that there is a clean build.

Regards,
Stuart

