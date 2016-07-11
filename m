Return-Path: <jacopo.malvestio@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id BBBB660589
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 22:32:58 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o80so120645wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 15:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:subject:to:reply-to:from:message-id:date:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=ktjB80mIFcQ/OhcfyU0c6rGIMNfvkzf5i7BrGI+iWUA=;
	b=mNXG1LYjrBHdtqx6ppEjIU0SWytWAkTQks/mKtVq5goAMo4v8KxJ5e3aVWG+HHp3Ii
	/mmitXuuHNWHaqHJ9QXXdd7TWgqT6P0sjIuza+8jJMA72q9xElyhTGwN7BGl+fNhRcXC
	yyW0RSRqpap7Z5RqVtXJDeTjg0SnQi4+6tlmHCfb91DmdEusraYnZZ72WJiCliwWNFsU
	H9vJlfN3LsezM1ieiW9M3XDvOPLhDEAgtSCD3a9mVXrkNWqpXLgYpVRJ6psl2KTMoVq1
	G5lFbMcIbO0pehzhynInhnLA8QwdxdLEoKWwnopQ1ES9DOdEb+NWcnyZe/My5J+F9AXy
	J7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:subject:to:reply-to:from:message-id
	:date:mime-version:in-reply-to:content-transfer-encoding;
	bh=ktjB80mIFcQ/OhcfyU0c6rGIMNfvkzf5i7BrGI+iWUA=;
	b=lQy//CNIIZyVHKhE1aUgk/GT5allS6Sy5XuioaHLFxGk5F9QBka1IaREt7z4jbNhG6
	w4WJjekH6DJTYnRxKMSykkmUx4Knb02BENSf92Kz5h1eNGVr6e3shunPgM5thJ4pTFLF
	XAjOBlqh3klnXfvqzypq5TN0gwKxKneEeJa/we550v77aooCzaro9/X2BlJCJDxOaKt9
	snsTevqNOFq8jAVGb/uSkG0EX3sGqhRkaA3sW0Yf4RVV8DcujKZZuJmUUDlQZpCu6ygB
	4q61OveL0ahurIot2WjT8C+C47f9Jh6eD8Xc6wc5luZCG/Few4JBdvSScTdlyrtdpmvN
	7uSw==
X-Gm-Message-State: ALyK8tKl7vXrFlQkeP6+PCN09QKGL+IfcQt7Iil4/MVep1PbrLBhTOiulIFwnZ6/nJeWLg==
X-Received: by 10.28.203.2 with SMTP id b2mr11392044wmg.78.1468276378221;
	Mon, 11 Jul 2016 15:32:58 -0700 (PDT)
Received: from [192.168.81.105] (2-234-21-239.ip220.fastwebnet.it.
	[2.234.21.239]) by smtp.gmail.com with ESMTPSA id
	kg2sm1899510wjb.10.2016.07.11.15.32.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jul 2016 15:32:57 -0700 (PDT)
References: <14c344e66a5112f492cc21c9a7d0f217@xmsnet.nl>
To: openembedded-devel@lists.openembedded.org
Reply-To: jacopo.malvestio@gmail.com
From: Jacopo Malvestio <jacopo.malvestio@gmail.com>
Message-ID: <9b1d361b-b845-700f-d780-bbccc958a1c2@gmail.com>
Date: Tue, 12 Jul 2016 00:32:55 +0200
MIME-Version: 1.0
In-Reply-To: <14c344e66a5112f492cc21c9a7d0f217@xmsnet.nl>
Subject: [meta-java] gcc 4.8 and openjdk-8
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
X-List-Received-Date: Mon, 11 Jul 2016 22:32:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello All,

I've created a .bbappend file with:

CFLAGS_remove = "-fno-lifetime-dse"
CXXFLAGS_remove = "-fno-lifetime-dse"

but the do_configure step fail, bitbake -v openjdk-8 log:

| configure: Current directory is /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/build.
| configure: Since this is not the source root, configure will output the configuration here
| configure: (as opposed to creating a configuration in <src_root>/build/<conf-name>).
| configure: However, this directory is not empty. This is not allowed, since it could
| configure: seriously mess up just about everything.
| configure: Try 'cd /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2' and restart configure
| configure: (or create a new empty directory and cd to it).
| configure: error: Will not continue creating configuration in /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/build
| NOTE: The following config.log files may provide further information.
| NOTE: /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/build/config.log
| ERROR: configure failed
| ERROR: Function failed: do_configure (log file is located at /home/jacopo/yjp/poky/build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/temp/log.do_configure.2980

I'm running on ubuntu 14.04 with gcc4.8 and openjdk 1.8, i don't think it's a side effect of the gcc6 patch,  but in your opinion, i forgot something?

thank you

--
Jacopo





