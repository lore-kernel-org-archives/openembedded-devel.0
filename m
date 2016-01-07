Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id C042960620
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 18:59:33 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id o11so334980733qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2016 10:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=KyjjWXL1XM0kPC62OgpUqVpWSsNdl6laj2V45+TEnjU=;
	b=jRmxVkXFTuqWNEMsfU/J5XlU+zV2Ad4IwREowC62hsawEnp+QtB239HVzdBINioCpR
	71HwDlRReF2nruCQs95fidVsjbj3GNrx7wKiYwQczqT5d+KG5frWVxZpLcvqo9PrbNvs
	swt8vO7P0JpejIokmn/cqAlH08l6WWol/DAFlcnHddJeJbCddYdxHCIoO5T7nPST5O1G
	xLBNKRSTElgh2SD24YHpk/DCOtddBlT3Bl1ey5nDwtPecjsLUmNmyQgFlNIq3ktopbmK
	Ngju57Z6RDaqyMel+N88rmNN4QVg+j9NwNLN1cQoTe5k1h7oVT5gwjox73iBf2QT+nNl
	ahTQ==
X-Received: by 10.140.155.87 with SMTP id b84mr83986206qhb.29.1452193173689;
	Thu, 07 Jan 2016 10:59:33 -0800 (PST)
Received: from localhost (189-72-93-128.bnut3700.dsl.brasiltelecom.net.br.
	[189.72.93.128]) by smtp.gmail.com with ESMTPSA id
	n91sm38276914qkh.11.2016.01.07.10.59.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 10:59:32 -0800 (PST)
Message-ID: <568eb594.de1f370a.2b615.2b4c@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Thu, 07 Jan 2016 16:59:27 -0200
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Thu, 07 Jan 2016 16:59:27 -0200
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.5
Subject: Updates to meta-browser (master) in 2016-01-07
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
X-List-Received-Date: Thu, 07 Jan 2016 18:59:34 -0000

Hello,

I pushed following updates:

commit b6d46d69a261fe6bd7c1e9811dc2a9bbd0b79aeb (HEAD -> pending, origin/master, origin/HEAD)
Author: Trevor Woerner <twoerner@gmail.com>
Date:   Tue Jan 5 16:15:42 2016 -0500

    chromium: add kiosk-mode PACKAGECONFIG
    
    If you are creating a kiosk, then enable this PACKAGECONFIG and the browser
    will start up fullscreen and without menu bars etc.
    
    Signed-off-by: Trevor Woerner <twoerner@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 36b98f52a929aa26405735cdd23c877b836599a2
Author: Trevor Woerner <twoerner@gmail.com>
Date:   Tue Jan 5 16:15:41 2016 -0500

    chromium: update run script for early run
    
    If the chromium run-helper script (google-chrome) is run as part of a
    (sysvinit) init script, shell variables $USER and $HOME will not be set
    (leading to unwanted behaviour).
    
    Replace the use of $USER with `whoami` and replace the use of $HOME with the
    OE bitbake variable ROOT_HOME.
    
    In this way the chromium run-helper script will work as expected in both
    instances (as part of an init script and from the cmdline).
    
    Signed-off-by: Trevor Woerner <twoerner@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 5dd3fa45fb48261da33c3d99c464e2186ab54d39
Author: Trevor Woerner <twoerner@gmail.com>
Date:   Tue Jan 5 16:15:40 2016 -0500

    chromium: API keys update
    
    Add more information to the "disable-api-keys-info-bar" PACKAGECONFIG
    description regarding another way to disable the "Google API keys are
    missing" warning.
    
    Signed-off-by: Trevor Woerner <twoerner@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

