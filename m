Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9536966099
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jun 2014 18:26:25 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id 9so1392933ykp.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jun 2014 11:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=VkblTRVA3KhFo5p1+JP9LeTOc0YacNB018NC2jWJw5M=;
	b=bXgggt8uRgCQSonDe3O8scraINwFfXZG/eKRPq2jW91rPYoTuox9n9ZR2Ir6ElbFIP
	kI+ADr+fwo9Xxji2G4Z+l9m5icRqPNLY64CzQdjfVMiel/IEF4Id+74bb4miNO3yXM+a
	VTt2EvsGGjrDZUwVvux0OEE5a4u0CJExOMjKyokxq/tTlWmvFwFcLJSON5SDK0N5siHy
	+64Rev8gL7TLQzVNlQuWz74KnHt0If3dI7+lgdDrabiYFcnMQvfp83GxtLByDq05UMV3
	PmGOgkgoW+oyzgeCbMgwOuDGanqz/KfkE6ov22PEef/cpBZerW1tVhEDKDjO3xm1HE6y
	wmRw==
MIME-Version: 1.0
X-Received: by 10.236.124.7 with SMTP id w7mr16307731yhh.33.1402338385933;
	Mon, 09 Jun 2014 11:26:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Mon, 9 Jun 2014 11:26:24 -0700 (PDT)
Date: Mon, 9 Jun 2014 15:26:24 -0300
X-Google-Sender-Auth: W82tHPFH09vTISMG_HBTmxc_UVg
Message-ID: <CAP9ODKqTn-EkRWtX8XSMurzOSjsoPrcD-G2FdB0gX+WYOduFtA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [meta-qt5] Use of nativesdk for developer utilities
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
X-List-Received-Date: Mon, 09 Jun 2014 18:26:31 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

One of our customers need to run some Qt5 tools in their SDK and we
want to have it generated properly.

Currently the issue we have is:

...
cd .../build/tmp/work/i686-nativesdk-oelsdk-linux/nativesdk-tufao/1.2.1+AUTOINC+a4832b4c94-r0/build/src
&& .../build/tmp/sysroots/x86_64-linux/usr/bin/cmake -E cmake_automoc
.../build/tmp/work/i686-nativesdk-oelsdk-linux/nativesdk-tufao/1.2.1+AUTOINC+a4832b4c94-r0/build/src/CMakeFiles/tufao1_automoc.dir/
""
Generating moc_abstractmessagesocket.cpp
No such file or directory
AUTOMOC: error: process for
.../build/tmp/work/i686-nativesdk-oelsdk-linux/nativesdk-tufao/1.2.1+AUTOINC+a4832b4c94-r0/build/src/moc_abstractmessagesocket.cpp
failed:
No such file or directory
Generating moc_classhandler.cpp
...

and our work in progress patch is at http://privatepaste.com/0716d38b91

Do someone have any clue why the MOC utility is not being found?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

