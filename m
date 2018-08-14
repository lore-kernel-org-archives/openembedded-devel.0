Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 65F2378FD1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 14:40:17 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id 191-v6so13496713qki.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 07:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=X1rgXCJciIqPrDIzzuqlP8Uywz1AnOg0ls5ccgF0Ga4=;
	b=oCZ7gLr88cEg9pXeLkTs+BpBOcdNDBfe2luK86H3d1HLo1Rs0vpkfz/ft+Ih9f22mF
	rQ4Cs74XUh7C3VuOMlnnhI6J+TB66LtQPg1WBAWtlWn/2lJvkZCauhMMYiIvDp7Bu+QB
	bfoiy3XfytTNAoAH+KqIbuauz+5s0PZ2gwJxJPGsykMb+xTuUzzWX8W3ei+5ctGR+Omr
	zafQfUJMBT+cHBTTsBD93u35p9tWgNzWCtAG/OtLZFe0bk/QNCUy/aQx5R9K/LloBLpH
	msO8SEmNPmko93nCPa5S4aPpXVt/IfUnR8DUxuISm+sdRT+YEt91rECaO6QNs4hwHS4x
	u0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=X1rgXCJciIqPrDIzzuqlP8Uywz1AnOg0ls5ccgF0Ga4=;
	b=oFQE7iuP5rNGBeEYbAYKU5IsOqdpTRX4zeNDGOW66XcLI2xH1ip53XEpNZE3YmDMbd
	26zqUZsU3dig4jgsfaWJ4zpt67kDUP8UvC2qDZZSkdwVLcTaK7L2Fo8WiYE66vQ8YxZj
	UWIuHlhzRc559sVfW1o7ZBkytmOrP07WIGn7dL5oP2yFj7DwOCWiPuPq5nTUbMZTHGhl
	DQwjbCeGF5bxEkYOUP+jKuJKOsRA93rBrZsKYagKaY9IiDscLLQv+1Kufg0Oo+RP+EBk
	paBruqEFtwc9A0uYE+hE6MBdSlVC23Uhzei9VCo0Urzeh6JOTBcqXU7+Dl44yzHT/EGd
	rWGg==
X-Gm-Message-State: AOUpUlG6XAbb7GR49n6TzUD3UWGb+15MSnIt1/Gvql99TlD4vdk8T/8w
	tUnzt/Nli37RUgaBzaqojoL0HnAKKvtoRM1LPj4U+A==
X-Google-Smtp-Source: AA+uWPywzVOshFQCU55kBSoupwI9v14WerNZUM4W8R6IAfcxi346tZ/+9LmFjZUvokQ66su5s3FKnG774vz+BAyGk7c=
X-Received: by 2002:a37:6e82:: with SMTP id
	j124-v6mr20735164qkc.179.1534257618146; 
	Tue, 14 Aug 2018 07:40:18 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Tue, 14 Aug 2018 16:40:06 +0200
Message-ID: <CAGCTLNTdnkheJF=i--w3+m_Yg9zhojoM=yMGb3_SACRysR3hOg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5]: required packages to run qt5 qml applications
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
X-List-Received-Date: Tue, 14 Aug 2018 14:40:17 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,
I need to know what is the minimum packages which I need to add to
IMAGE_INSTALL_append variable in local.conf file
to be able to run qt5 qml applications in custom image on Minnowboard
Turbot that support wayland without x11. ?

Thank you,



-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

