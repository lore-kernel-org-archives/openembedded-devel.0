Received: from mail-bk0-f52.google.com ([209.85.214.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1Tvcem-0000bm-TY
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2013 00:44:36 +0100
Received: by mail-bk0-f52.google.com with SMTP id w5so1021817bku.39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2013 15:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:from:date:x-google-sender-auth
	:message-id:subject:to:content-type;
	bh=xgIccLwWeFnKNAF30xRQpqAmzivTAZIkKk1mj4NnP/E=;
	b=FA4jhlzJe9P3ZgPMqaTcoXLpjvVi3d7Of8Qytji25KbfyVKLKSPE5Iy9AMGBVTqlBW
	lBUFcEIhzRtOzwwxM7T4kdO2m1vTW6EjN5P40mqJEIw7Dd7MHBZP5JKGaAo0SSuuac8O
	QxEeva/gOuXLt61ZVqb5w/4N7egXkli+VpdPwjsoGdFZmUgvmAMdxnO1m+q4/lFLh/F2
	GDpJpYv4KE0Fh5ijnr+a+GU6ayhSxeWy3nRTsPbvmL2m1K2epKC0oLKSPz1u9GsUJMXO
	fzvdLoLYZ00pDU9eBDTfnMVD+a+tVWwhSFAoPGIR1IDjAsDMPeOh3L21zQDv+j+UosjU
	OuDg==
X-Received: by 10.204.148.195 with SMTP id q3mr917633bkv.122.1358378950503;
	Wed, 16 Jan 2013 15:29:10 -0800 (PST)
MIME-Version: 1.0
Sender: takeshi.ken.hamasaki@gmail.com
Received: by 10.205.102.72 with HTTP; Wed, 16 Jan 2013 15:28:50 -0800 (PST)
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
Date: Thu, 17 Jan 2013 08:28:50 +0900
X-Google-Sender-Auth: mT9Oghlaf0atsfwT1gVtx9koW10
Message-ID: <CAPESJy5XQKweZqj8GAsp3HEtgVDgDc4NgbjTqMQbfQi6n_uG9Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: /etc/init.d/networking from netbase package
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
X-List-Received-Date: Wed, 16 Jan 2013 23:44:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Now I'm trying to build a simple image which includes udev and netbase.
(I know that main stream is using systemd, but my C7x0 has too short memory
 to operate systemd.)

After the build, I noticed /etc/init.d/networking is not installed on the
rootfs while netbase_4.47-r1.ipk includes this file.

Is there any magic behind that prevents this file installed or removes this
file after the package installation?

According to https://bugzilla.yoctoproject.org/show_bug.cgi?id=2486
there is a plan to split /etc/init.d/networking out of netbase package,
but this change is not applied yet, for my understanding.

Now I'm on the denzil branch, angstrom-2012.05.

Actually I want to make a new bug on yoctobugzilla,
due to the mail server problem on my side I can't
finish the registration process for few more days.

Regards,
-- 
Takeshi Hamasaki


