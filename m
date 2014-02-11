Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id D63C46EEA7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 14:20:09 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id 131so11233219ykp.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 06:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=miMOfwHWBK1zJSRhqfwJuCTxm83iV05BgwKeVAoS3oE=;
	b=iidcxo6ZGtArZ8s35obxncdNBJvXgaExdml+dv3j8LrO/fHVFTn6ZB6yjZ6NODhGAN
	Xb4HscmuwKwiK+pEfYvUsESs3We5kJu4R7lrCGzb5LUEbRI6IWNtFQJN9Xa9HroxTTvG
	HIFtQifrIWPJnmWlaBMpbByvIBOIitt9yAtHn7N4MQnufAFgPd4WFkMNLEQtIQ05rjyn
	fx7ZuJIHEmK7vgIpvyIn5noCjHT5VbNVV9IuJFi0twiQD2blM6zFouSXHEa47FZ5i+tF
	WIs1qqUTI1bPnyn9v2lqFIlf9j0uKvDkCbDnZtMzW3YqifXJP5GvH8+EPTFrIYmn/Eaf
	ZJJw==
MIME-Version: 1.0
X-Received: by 10.236.74.73 with SMTP id w49mr2188058yhd.87.1392128410022;
	Tue, 11 Feb 2014 06:20:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.161.3 with HTTP; Tue, 11 Feb 2014 06:20:09 -0800 (PST)
In-Reply-To: <1392067015-16328-2-git-send-email-denis@denix.org>
References: <1392067015-16328-1-git-send-email-denis@denix.org>
	<1392067015-16328-2-git-send-email-denis@denix.org>
Date: Tue, 11 Feb 2014 12:20:09 -0200
X-Google-Sender-Auth: z7rWnbsfgFHc5rmawE68Q7RAooc
Message-ID: <CAP9ODKpyPBJMu+ieCKBZarnGaJTTpq+4w_3zHJxPEuTrSi=g7w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCH 1/3] packagegroup-qt5-toolchain-target: add Qt5 SDK target packages
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
X-List-Received-Date: Tue, 11 Feb 2014 14:20:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 10, 2014 at 7:16 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

This includes some new package we were not installing. Those are:

+    libsqlite3-dev \
+    qtscript-mkspecs \
+    qtxmlpatterns-mkspecs \
+    qtsensors-mkspecs \
+    qt3d-mkspecs \
+    qtlocation-mkspecs \
+    qtsvg-mkspecs \
+    qtdeclarative-dev \
+    qtscript-dev \
+    qt3d-dev \
+    qtlocation-dev \
+    qtsensors-dev \

Do you want to do a commit on top of mine or should I just squash it
into my previous commit and put a note in the commit log thanking you
for the contribution?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

