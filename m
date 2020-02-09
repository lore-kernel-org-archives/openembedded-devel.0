Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id B194F60D64
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 15:11:05 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id u6so4459625wrt.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 07:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qHsBJBKuQWrSNR7tKi/papKR/De+RU9indO9XM51iZI=;
	b=qAPrK/st4n+pvaP+258cACjN522TYUkByhzASd/UDSLYtuZKJ0wdCbEp4iqa+Xi/3e
	B73PjzRYEXzhkkIoVEdXgVXDt2Qt+iebU4PsW7IIukXXHTpZdCZqsew6xc68Onc9jpkK
	V06uu4Q6Iw23peluZmw8Jq9GaCrEsX06c7e7gTF+gJBJgSwuckeaMPYf6GJrZ2BMxviK
	nes+GeFw8Tcc9nPSvEzjWlYiaWcWm8SthfbNa9Of6Nhtdpdz2EGTOiFPIOyTM187p7Ei
	Az4X1INWWmbWjYODhPFPwqPLArqcUOt+1q4H7jLoeoxLkv1TFE3iYi6GJe/mZ6aJ+FZ7
	ko6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qHsBJBKuQWrSNR7tKi/papKR/De+RU9indO9XM51iZI=;
	b=mSCWuVlHJ+wDrEM1HJMqYJCUl7bSHZK9IZ0P7tcPGdNCqL4XOtViTL/wOPbFisp9by
	yeli71uJJlk8qXqlfFSFaPjxi7wer6gCKYkCAPR4KXNTA7wlYc6Saun1PjDOQllYhgxx
	5RUmbr2VhuIP7YbdPCqoK8wbUkOM8vn+N1vn8ZUOdfZzSrEAm75Gdef9ITcBr4eJ+6Mi
	4h9TZY4w8L4VoIKMwrkbbtStp6CgCS2I9K23xBY7bVOeZUj82bCFhtJkZIGJ1ZRjE3yA
	JFLwPn4N3CsiozJ+gbJsXAqUTJzQhWCFaCnwEQi5GPjE0y7YiGgPfURCjAhP8Oj16Rzz
	R0Rg==
X-Gm-Message-State: APjAAAUaKVC0f3CGgaAA10RcJYBpR/Tj9V7/t9k0E4pn6aMgjc3yaiVk
	sDZO6SIhiVxhcIWzcFoAAbTJJ7DG
X-Google-Smtp-Source: APXvYqysZRyN4BFJOM2/vRlbxSzrP/X9vgEo80dpFNKaJznn6S//W/FA3tuaWv7DsJXM1JzESLIbng==
X-Received: by 2002:adf:fa86:: with SMTP id h6mr11318603wrr.418.1581261066336; 
	Sun, 09 Feb 2020 07:11:06 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F2C16629984A4CCEAA4B6A2.dip0.t-ipconnect.de.
	[2003:f0:7f2c:1662:9984:a4cc:eaa4:b6a2])
	by smtp.gmail.com with ESMTPSA id
	q10sm11429093wme.16.2020.02.09.07.11.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 07:11:05 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 16:10:51 +0100
Message-Id: <20200209151053.4277-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200209151053.4277-1-schnitzeltony@gmail.com>
References: <20200209151053.4277-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 4/6] mypaint-brushes: initial add 1.3.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Feb 2020 15:11:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it is a (r)dependency for upcoming gimp 2.10.14
* there are 2.x versions available but these are not what gimp requires

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb  | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb

diff --git a/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb b/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb
new file mode 100644
index 000000000..d4d08fe8d
--- /dev/null
+++ b/meta-gnome/recipes-gimp/mypaint/mypaint-brushes-1.0_git.bb
@@ -0,0 +1,12 @@
+SUMMARY = "MyPaint brushes"
+LICENSE = "CC0-1.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=65d3616852dbf7b1a6d4b53b00626032"
+
+inherit autotools allarch
+
+SRC_URI = "git://github.com/mypaint/mypaint-brushes.git;protocol=https;branch=v1.3.x"
+SRCREV = "be9fdf9ef6c54e29c7499992f04e29114857b3fc"
+PV = "1.3.0+git${SRCPV}"
+S = "${WORKDIR}/git"
+
+FILES_${PN} += "${datadir}/mypaint-data"
-- 
2.21.0


