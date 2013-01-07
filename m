Received: from mail-la0-f42.google.com ([209.85.215.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gopikrishnans@pec.edu>) id 1TsBoo-0001ot-BA
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 13:28:42 +0100
Received: by mail-la0-f42.google.com with SMTP id fe20so15467392lab.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jan 2013 04:13:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=Pgmx0mr9XMoFjAQdC3odkst0kuaApIz97FGbMxNks48=;
	b=XalrttWKS2yVGCIsP9gBaXFuGIV3uuhyeA1BQ1y4+A4mGAbIt10e5wVLAzzY3qkj1B
	TidZO6UbjrrfvREzTEnKgVZHBaJAxXjT98BrqtiVgPXqQWy+8jF1Ae0hgDOVkkdocl50
	/kZoh7oBdBfnGBlrWLMSC8Cc1YY/Z0imb2+nJKOsJuaI2L9gV5AA92cXPJFRRmEDZG0z
	gBnOaEezggXXsCOG3KgwP46KCAgcz6uFqlKKxEqBk+KsRdBgjX56doyIhnDg8Tj0la6s
	VgNdP6fWbhuAqYV9jZe8xZbm9yMWW8TjqNMQQbgzplFDGabEZRoouvg+i44LyRNALQsS
	y7mA==
MIME-Version: 1.0
Received: by 10.152.112.36 with SMTP id in4mr58188413lab.35.1357560812943;
	Mon, 07 Jan 2013 04:13:32 -0800 (PST)
Received: by 10.112.137.229 with HTTP; Mon, 7 Jan 2013 04:13:32 -0800 (PST)
Date: Mon, 7 Jan 2013 17:43:32 +0530
Message-ID: <CAOkC3RY4n66f9LgvWczskaDUn0wPOjBDbDAoKCMo8CjnFWzgSA@mail.gmail.com>
From: GOPIKRISHNAN S <gopikrishnans@pec.edu>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkQeyhIbBqVFLRIwhKGCZRxNSl7P17PqV7RiiGce4dnP1NyCBm+HDIokFsLTfhpBhPmOc+8
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Reg: Hiawatha
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
X-List-Received-Date: Mon, 07 Jan 2013 12:28:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am facing strange issue while building Hiawatha for Freescale P2041RDB.

I am getting some errors while building hiawatha(using recipe from
openembedded). In investigation I found all return \type and parameter type
seems to be same & in all /usr/include/*.h files in declared as extern was
added before to make it visible in global. I wonder no problem was
not raised while compiling for my host platform (Debian 6 on x86), and
getting problem only doing it for my freescale board

/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/work/ppce500mc-fsl-linux/hiawatha-8.6-r2/hiawatha-8.6/src/alternative.c:39:5:
error: conflictin
g types for 'unsetenv'
/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/sysroots/p2041rdb/usr/include/stdlib.h:589:12:
note: previous declaration of 'unsetenv' was her
e
/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/work/ppce500mc-fsl-linux/hiawatha-8.6-r2/hiawatha-8.6/src/alternative.c:49:6:
error: conflictin
g types for 'clearenv'
/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/sysroots/p2041rdb/usr/include/stdlib.h:596:12:
note: previous declaration of 'clearenv' was her
e
/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/work/ppce500mc-fsl-linux/hiawatha-8.6-r2/hiawatha-8.6/src/alternative.c:39:5:
error: conflictin
g types for 'unsetenv'
/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/sysroots/p2041rdb/usr/include/stdlib.h:589:12:
note: previous declaration of 'unsetenv' was her
e
/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/work/ppce500mc-fsl-linux/hiawatha-8.6-r2/hiawatha-8.6/src/alternative.c:
In function 'strcasecm
p':/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/work/ppce500mc-fsl-linux/hiawatha-8.6-r2/hiawatha-8.6/src/alternative.c:49:6:
error: conflic
ting types for 'clearenv'
/media/sdk/3.1/QorIQ-SDK-V1.3-20121114-yocto/build_p2041rdb_release/tmp/sysroots/p2041rdb/usr/include/stdlib.h:596:12:
note: previous declaration of 'clearenv' was her
e


Does any have patch to fix this issue?

