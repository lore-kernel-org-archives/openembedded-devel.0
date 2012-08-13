Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1T11Qj-0003sJ-FN
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Aug 2012 22:40:05 +0200
Received: by yhjj56 with SMTP id j56so3497329yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2012 13:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version:x-mailer;
	bh=ZFBtqXYp/lTW27Fe8aJS0ngzhmT+iQ9FAbDfFXu5CrM=;
	b=H0TxlmnWtAF09P2yXr80ZkX11t9a9o4+PdiUWJkhYBOWTsdf8aJMAj/SbMaclz+TIB
	KcWj/hCDjNegHn1A226ItbXU3MiD6K1I2v4XnZ8V90naJwJVHFOqY/JVATeS5ZglRChs
	DkNMJt851imOsq2GMlyvYecEGmT7zMWAr/6uxH5dQU1FGdVrzhjeRys4oGoaSCrlGq2B
	aGOv0m3qi+zw9DwY6IWMgFh4+ChnbqCYN9EY0PD8Yt9u49rfmpghlwQxfAeSq65W4tLf
	ba63ciuE8/0qPAhrA/tKpOsSFZD+Ocq51I6ZMSrWZFRRiKD0pIx1mvulnvvZ9X0LDBNr
	fAPw==
Received: by 10.68.228.231 with SMTP id sl7mr20901405pbc.45.1344889691008;
	Mon, 13 Aug 2012 13:28:11 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id rd7sm144833pbc.70.2012.08.13.13.28.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 13:28:10 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Tue, 14 Aug 2012 00:28:05 +0400
Message-Id: <B39AAE57-63B2-4EFA-A037-4F225E1CB21B@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Subject: [meta-openembedded/toolchain-layer] Adding retired toolchain support for gcc-4.5.1 and eglibc-2.13
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
X-List-Received-Date: Mon, 13 Aug 2012 20:40:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
      I've created a set of patches to add retired toolchain support for =
gcc-4.5.1, to the meta-openembedded/toolchain-layer.=20

I've also included a patch for eglibc-2.13. Builds for PowerPC 440 =
processors soft-float don't work with eglibc-2.15 and 2.16.

I could add it to the meta-xilinx layer, but I prefer to put retired =
toolchain support into the toolchain layer, so that it is generally =
available across all layers, in case someone needs it.

Do let me know if it is okay to go ahead and submit these patches for =
inclusion into the meta-openembedded/toolchain-layer!

Best regards,

Elvis Dowson=


