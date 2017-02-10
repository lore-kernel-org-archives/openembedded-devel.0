Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id BE71965CBB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 11:57:58 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id 35so26174762uak.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 03:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=U8TFIKZ56muehR3YL1N+VnLqZvI0rMLtQXp1shXPuYs=;
	b=a40BXIzbP1piGnidAhSwhXkeGelaTMqSmfjWynO62KksiLh4caDrndtbdwtwefSioz
	tkA2/SX8+4J+SzdI3k6DklJDp89xdt+UOOhydyw81PQRfz2ee7lO/TlPuhj/sYRbhjyY
	5zNnKdZnTJ36ZgQbZZSIPMNdQd0X6AMx0iluM+DXjIUvwR9L2li9+0qyOMIHBSOhKFYq
	PzfYfYQAsS1XnnuOecs1EkD0wNGne6K1Tb7kbwtgmKyH85p5hsNVeSaQqN9BjOqWa37H
	qPA5CfobMfxnzrRB/lGt7qL22zE/qbWBaYGAqVIH4ho+r5cG9XRt0Iz9SHodkSHIlmtj
	aZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=U8TFIKZ56muehR3YL1N+VnLqZvI0rMLtQXp1shXPuYs=;
	b=Z9FT5+B1KF111H8EsN+a8JEY/Ug1jPjEyfQKOrdZ8uZGv2wfseu/GaXKWHlSAIJcGT
	Pd5D4WZcDFsVa6YZj62bNVvkH4mtXgspsxhq0Pzx3Itkw/AWgpW/NZU042uueYRFyU1j
	flw9wTSWJf7WO/dmvgwElACsTS5YOBtAZcAArBJ2I5/GBIvAYcCJGIhwzLEEcrA+6jUr
	5QQ1J/RLuXdWxWXEBeLNQnKWtFrf4M8Et+qsCy1uRuGcIs6ZJmDmGs9dFK/zTSlmHN1g
	gpaOALMFiuPx7pPpkvLxGm5lZEwnoTRnkJxANgoL68Y56fwG7VE5AWWzU26xiSgGASiT
	/BLw==
X-Gm-Message-State: AMke39nmHkdbEMKEpF351TwBOHVce+rpuH9OsVO0jPz0EbD77O39ZRFPMfE9Rs0Wcg8cZZ5yqwVaYArO+puoNw==
X-Received: by 10.176.3.46 with SMTP id 43mr4429147uat.79.1486727878484; Fri,
	10 Feb 2017 03:57:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Fri, 10 Feb 2017 03:57:58 -0800 (PST)
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 10 Feb 2017 12:57:58 +0100
Message-ID: <CALbNGRTmi8JOaeLgBONgkMTgYcBVoTp_L6u54NsLU3+Qqh9wYg@mail.gmail.com>
To: development@qt-project.org
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] Qt5.8 qdbuscpp2xml broken for kde baloo?
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
X-List-Received-Date: Fri, 10 Feb 2017 11:57:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2017 at 11:19 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Hi,
>
> I am cross building Qt and KDE with yocto environment. After Update to
> Qt 5.8 the package baloo from KDE KF5 is broken. After investigation I
> found that qdbuscpp2xml 5.8 build misses some public slots.
>
> I get for Qt5.8 build by yocto:
>
> qdbuscpp2xml -a filecontentindexer.h
> Unregistered input type in parameter list: QDBusMessage
> Unregistered input type in parameter list: QDBusMessage
> <!DOCTYPE node PUBLIC "-//freedesktop//DTD D-BUS Object Introspection
> 1.0//EN" "http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd">
> <node>
>   <interface name=3D"org.kde.baloo.fileindexer">
>     <property name=3D"currentFile" type=3D"s" access=3D"read"/>
>     <signal name=3D"startedIndexingFile">
>       <arg name=3D"filePath" type=3D"s" direction=3D"out"/>
>     </signal>
>     <signal name=3D"finishedIndexingFile">
>       <arg name=3D"filePath" type=3D"s" direction=3D"out"/>
>     </signal>
>   </interface>
> </node>
>
> On my local fedora Qt5.7.1
> qdbuscpp2xml -a filecontentindexer.h
> <!DOCTYPE node PUBLIC "-//freedesktop//DTD D-BUS Object Introspection
> 1.0//EN" "http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd">
> <node>
>   <interface name=3D"org.kde.baloo.fileindexer">
>     <property name=3D"currentFile" type=3D"s" access=3D"read"/>
>     <signal name=3D"startedIndexingFile">
>       <arg name=3D"filePath" type=3D"s" direction=3D"out"/>
>     </signal>
>     <signal name=3D"finishedIndexingFile">
>       <arg name=3D"filePath" type=3D"s" direction=3D"out"/>
>     </signal>
>     <method name=3D"registerMonitor">
>     </method>
>     <method name=3D"unregisterMonitor">
>     </method>
>   </interface>
> </node>
>
> You can see that qdbuscpp2xml complains for unregistered QDBusMessage
> and the slots 'registerMonitor' and 'unregisterMonitor' having
> QDBusMessage in parameter are missing.
>
> Since yocto builds also native qdbuscpp2xml it might be possible that
> there is something missing for qdbuscpp2xml.
>
> Pointers how to get around or even confirmation of a bug are welcome -
> baloo's filecontentindexer.h is attached
>
I have straced qdbuscpp2xml build with Qt 5.7/5.8

My 5.8 qdbuscpp2xml does not try to load a single Qt library. 5.7
qdbuscpp2xml loads libQt5DBus.so.5 right after start. This let's me
assume there's something wrong with our build of qdbuscpp2xml.

Andreas

