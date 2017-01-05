Return-Path: <sragolu@mvista.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 07AA96071F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 07:48:45 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id k86so30169230lfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jan 2017 23:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=sGpELRpak7JH9Mp0Z/7faR4R+S+vzB5mub0baFRo920=;
	b=NuRqOQCdqESxDjqEr7SLfC7CBDlG2nszpSIM4e+V1VWcnTCd4r1hJRinirGZ9X6Rqu
	Ty3jE/EzW2Rcha5EklbY+MpbcARODAMNKb38rCS4ZReb3moV7pjWhVCWjUMVwUtqGEyz
	NJXDyNm7SCmAjFLtfNzLqwm1H/5wVZ0I1oZljYRA4yyJNbCYXu3Mtj+wYqdVT/5GgrEO
	+DCwl1M2oozXBIgKwGfDA3ab5tsDK6I2KJbgRLuCSutz0+d8f2MoXqGLX/6/PIRvtSpI
	x/ovlJkZzAhdgAKs64d75Xwsn27FOhFuZWRSsgHKAAkhuXY/26OIxqoQ+FDM/WZXhtU/
	YL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=sGpELRpak7JH9Mp0Z/7faR4R+S+vzB5mub0baFRo920=;
	b=mSz6eQl4972IB1hc6mDtbVzVuCCkxIoV6vUGUXnO6/nkCwwDngvn3YvKGuSu0WtdWG
	UnUW3qfAXjWqakD44pIbUUQAtMnxoWE8YY3Q5wmzZ1pCeUZq9+oIZSmMG2Nf58sNNNnI
	W9Zl/SQccxI22jPqSxgjrmfKvvCfyXOwJSAt11MzDUHKP+Xq8e25fNKUZnreurJ5/PxB
	h/jqtTbMgL4W9a9Nl68PlxlRbBUvtWJylURkMp3jYbZzHhdppjfyA9aFbmzslu6VPZXN
	bTN5urlA6ZfdJPe0aIUS8PgROUpz5JqNWwjU/YoXwZRyIjeXe/xb9pJYW3mTLInB3cDA
	wHCg==
X-Gm-Message-State: AIkVDXLQa5aaJYQ3Oiq75eoQozYR07M4/FDGI+BPTBjH1QqX3oF+LeQJzT8iYs7PFVMVHETRmYB/b3LqETOm3wKe
X-Received: by 10.25.26.136 with SMTP id a130mr20485406lfa.154.1483602525138; 
	Wed, 04 Jan 2017 23:48:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.208.194 with HTTP; Wed, 4 Jan 2017 23:48:44 -0800 (PST)
From: Srinivasa Rao Ragolu <sragolu@mvista.com>
Date: Thu, 5 Jan 2017 13:18:44 +0530
Message-ID: <CAH4+OFqvmaNj-jbBLhKjt=74nqPf11sg4LcAndQ2BoYzJOS8sw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Openjdk 8 compilation issue
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
X-List-Received-Date: Thu, 05 Jan 2017 07:48:46 -0000
Content-Type: text/plain; charset=UTF-8

Hi All,

I am porting openjdk 8 using yocto build setup and i struck with below
issues.

could you please suggest that how can I resolve these issues?

 /home/srinivas/cham-project/ericsson-project/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2/build/linux-x86_64-normal-server-release/jdk/gensrc/sun/awt/X11/XErrorEvent.java:50:
error: cannot find symbol
| public byte get_request_code() { log.finest("");return
(Native.getByte(pData+33)); }
|                                 ^
|   symbol:   variable log
|   location: class XErrorEvent
|
/home/srinivas/cham-project/ericsson-project/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2/build/linux-x86_64-normal-server-release/jdk/gensrc/sun/awt/X11/XErrorEvent.java:50:
error: cannot find symbol
| public byte get_request_code() { log.finest("");return
(Native.getByte(pData+33)); }
|                                                        ^
|   symbol:   variable Native
|   location: class XErrorEvent
|
/home/srinivas/cham-project/ericsson-project/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2/build/linux-x86_64-normal-server-release/jdk/gensrc/sun/awt/X11/XErrorEvent.java:51:
error: cannot find symbol
| public void set_request_code(byte v) { log.finest("");
Native.putByte(pData+33, v); }
|                                       ^
|   symbol:   variable log
|   location: class XErrorEvent
|
/home/srinivas/cham-project/ericsson-project/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2/build/linux-x86_64-normal-server-release/jdk/gensrc/sun/awt/X11/XErrorEvent.java:51:
error: cannot find symbol
| public void set_request_code(byte v) { log.finest("");
Native.putByte(pData+33, v); }
|                                                       ^
|   symbol:   variable Native
|   location: class XErrorEvent
|
/home/srinivas/cham-project/ericsson-project/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2/build/linux-x86_64-normal-server-release/jdk/gensrc/sun/awt/X11/XErrorEvent.java:52:
error: cannot find symbol
| public byte get_minor_code() { log.finest("");return
(Native.getByte(pData+34)); }
|                               ^
|   symbol:   variable log
|   location: class XErrorEvent
|
/home/srinivas/cham-project/ericsson-project/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2/build/linux-x86_64-normal-server-release/jdk/gensrc/sun/awt/X11/XErrorEvent.java:52:
error: cannot find symbol
| public byte get_minor_code() { log.finest("");return
(Native.getByte(pData+34)); }
|                                                      ^
|   symbol:   variable Native
|   location: class XErrorEvent
|
/home/srinivas/cham-project/ericsson-project/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2/build/linux-x86_64-normal-server-release/jdk/gensrc/sun/awt/X11/XErrorEvent.java:53:
error: cannot find symbol
| public void set_minor_code(byte v) { log.finest("");
Native.putByte(pData+34, v); }
|                                     ^
|   symbol:   variable log
|   location: class XErrorEvent
|
/home/srinivas/cham-project/ericsson-project/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2/build/linux-x86_64-normal-server-release/jdk/gensrc/sun/awt/X11/XErrorEvent.java:53:
error: cannot find symbol
| public void set_minor_code(byte v) { log.finest("");
Native.putByte(pData+34, v); }
|                                                     ^
|   symbol:   variable Native
|   location: class XErrorEvent
|
/home/srinivas/cham-project/ericsson-project/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2/build/linux-x86_64-normal-server-release/jdk/gensrc/sun/awt/X11/XErrorEvent.java:64:
error: cannot find symbol
| ret.append("type = ").append( XlibWrapper.eventToString[get_type()]
).append(", ");
|                              ^
|   symbol:   variable XlibWrapper
|   location: class XErrorEvent
| Note: Some input files use or override a deprecated API.
| Note: Recompile with -Xlint:deprecation for details.
| Note: Some input files use unchecked or unsafe operations.
| Note: Recompile with -Xlint:unchecked for details.
| 100 errors


Thanks,
Srinivas

