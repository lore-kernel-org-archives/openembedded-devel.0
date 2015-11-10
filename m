Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 41A6674197
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 12:56:57 +0000 (UTC)
Received: by qgea14 with SMTP id a14so88223981qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 04:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=nuDqTKewZgMYism9889+hTac/fAXX5nWlmQ6sA/KFX8=;
	b=NIqVKTvocRGNOewLa0SkjJK3t2AK+Q6nikOFdnOfj3pwzSrHhuTBzv8/25hhmPoMJ5
	dWCu5lOW2CVnWKwxd/1P+46MLLk4/48iFH1XkM9pXrnZkqAoyTw/B0XXYVOfvCN44hrP
	2R2cLUIDNvq7OEYIMomzaZcHUVop2Fu4imp7iTnG4zT5x1WihQfF1eSeKpwC7V7T26Hh
	mfqW93/KG4/Ks6zxLDU3v5QdithJmlzVtgeiuhB9thy2NL6IQMq8lIFpUvAwkB3OC7X7
	094yOt1a/OdUfzGSd/8D4pgbJVLvHGKY/rtpuWSY5EcWQrrVPN6c5hKQBLBA0tvXrk26
	Tr1Q==
X-Received: by 10.140.18.146 with SMTP id 18mr3917959qgf.1.1447160217986;
	Tue, 10 Nov 2015 04:56:57 -0800 (PST)
Received: from localhost ([177.100.174.62])
	by smtp.gmail.com with ESMTPSA id 63sm1229873qgl.31.2015.11.10.04.56.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 04:56:57 -0800 (PST)
Message-ID: <5641e999.c5158c0a.ed6aa.5672@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Tue, 10 Nov 2015 10:56:52 -0200
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Tue, 10 Nov 2015 10:56:52 -0200
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.5
MIME-Version: 1.0
Subject: Updates to meta-java (master) in 2015-11-10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Nov 2015 12:57:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I pushed following updates:

commit 0d7ba0ff39a332b0f93c4958370b2c7db9ea0e30 (HEAD -> pending, yocto/mas=
ter, m/master)
Author: Erkka K=C3=A4=C3=A4ri=C3=A4 <erkka.kaaria@intel.com>
Date:   Tue Nov 10 08:55:44 2015 +0200

    ecj-initial.in: Disable multithreading to mitigate segfaulting
   =20
    Cacao-initial-native suffers from sporadic segmentation faults, when th=
e Java
    program uses multiple Java threads, due to a race condition. In particu=
lar,
    jamvm-native and classpath-native builds would occasionally fail as the
    eclipse compiler used during build task by default uses multiple thread=
s.
   =20
    As fixing the race condition would require large changes to the
    cacao-initial-native codebase, and as it is only used briefly during the
    bootstrapping process, it is easier and safer to just force ecj-initial=
 to run
    in a singlethreaded mode.
   =20
    Signed-off-by: Erkka K=C3=A4=C3=A4ri=C3=A4 <erkka.kaaria@intel.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

