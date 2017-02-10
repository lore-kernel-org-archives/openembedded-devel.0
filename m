Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8C701600E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 10:19:14 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id x75so22274591vke.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 02:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=mGJGHF8F28UKMEH4+S3RWXLiJsXA0RPsGsE4Qk7XJRU=;
	b=fMcsUCGetta+sss3An6VsVFO80OQ+NLEdybSAlA67kVC7RkzuDO3Glyg4TNKrucegs
	Zn3hjNKGKVlsSNWdILCHwKpQ2w55AALx7Pho8unWIUwdj4ONSqU2q1XupXlB1FtUkntS
	PQfWDd4q3fRvXlTJjHKJ89bqL8tN6ywNh9v9SRVq0UqmpxwfhPTnFBGnJR6jCIqeMjSP
	bbbvDnzGc6hVXTSEfaHYUc+8voLMmzAoaOsOhnv33S8S5YRMd1j7J9sv4Zb52fVT+z26
	RjnK0cIPfp5SauynCRdf1J3jDelovMjed4tNKBhD9a+MQzfQ22ep6LttvVgLGSs3D0H4
	aujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=mGJGHF8F28UKMEH4+S3RWXLiJsXA0RPsGsE4Qk7XJRU=;
	b=H0x/lPdDKbruRwcjBPRuxXlror/8zNXUV29rsur17LCQnPv6FLRrsz1NVW7h3xTE/r
	e4WpIlUyQ3cR4+rQ9gREQpNXC8KCZYbuV8dRh6TlVSA6YmOs9ylrUm9KxVpw3qG3gpW9
	snIAJf/w+WCvYqF+lNDnK0x2vRERYj7Ll/vZNI3KPgrQS7xOsgn6QIzZhYDUonXNUSco
	KQB34vM1Ol15PyYE5YnHbq/0ahdnJZNegKJUbhcrnF19esnAjVKrxwVIrZTRxlVFswg2
	qxXkN2kHpl02X4wpkEWoU1mhQ5Hlbg+9H5bm00rRcKhinURYQYQUVaNVji3SJU70Hwqd
	AN7Q==
X-Gm-Message-State: AMke39nXnnLrqmxXxfhPX5rH0PP/aJERZsQMT1ElHb6VQSMddQMZn8xr1ZXuq/SNDSEhUEE5INzaKxHm10Y1+A==
X-Received: by 10.31.212.135 with SMTP id l129mr3281610vkg.134.1486721955056; 
	Fri, 10 Feb 2017 02:19:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Fri, 10 Feb 2017 02:19:14 -0800 (PST)
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 10 Feb 2017 11:19:14 +0100
Message-ID: <CALbNGRRds5ePq-D2j91rp4hHgXiyW=3V0GAXJAiiOmPvHXAQPg@mail.gmail.com>
To: development@qt-project.org
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Qt5.8 qdbuscpp2xml broken for kde baloo?
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
X-List-Received-Date: Fri, 10 Feb 2017 10:19:16 -0000
X-Groupsio-MsgNum: 65108
Content-Type: multipart/mixed; boundary=001a114eb4600333b705482a6ec1

--001a114eb4600333b705482a6ec1
Content-Type: text/plain; charset=UTF-8

Hi,

I am cross building Qt and KDE with yocto environment. After Update to
Qt 5.8 the package baloo from KDE KF5 is broken. After investigation I
found that qdbuscpp2xml 5.8 build misses some public slots.

I get for Qt5.8 build by yocto:

qdbuscpp2xml -a filecontentindexer.h
Unregistered input type in parameter list: QDBusMessage
Unregistered input type in parameter list: QDBusMessage
<!DOCTYPE node PUBLIC "-//freedesktop//DTD D-BUS Object Introspection
1.0//EN" "http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd">
<node>
  <interface name="org.kde.baloo.fileindexer">
    <property name="currentFile" type="s" access="read"/>
    <signal name="startedIndexingFile">
      <arg name="filePath" type="s" direction="out"/>
    </signal>
    <signal name="finishedIndexingFile">
      <arg name="filePath" type="s" direction="out"/>
    </signal>
  </interface>
</node>

On my local fedora Qt5.7.1
qdbuscpp2xml -a filecontentindexer.h
<!DOCTYPE node PUBLIC "-//freedesktop//DTD D-BUS Object Introspection
1.0//EN" "http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd">
<node>
  <interface name="org.kde.baloo.fileindexer">
    <property name="currentFile" type="s" access="read"/>
    <signal name="startedIndexingFile">
      <arg name="filePath" type="s" direction="out"/>
    </signal>
    <signal name="finishedIndexingFile">
      <arg name="filePath" type="s" direction="out"/>
    </signal>
    <method name="registerMonitor">
    </method>
    <method name="unregisterMonitor">
    </method>
  </interface>
</node>

You can see that qdbuscpp2xml complains for unregistered QDBusMessage
and the slots 'registerMonitor' and 'unregisterMonitor' having
QDBusMessage in parameter are missing.

Since yocto builds also native qdbuscpp2xml it might be possible that
there is something missing for qdbuscpp2xml.

Pointers how to get around or even confirmation of a bug are welcome -
baloo's filecontentindexer.h is attached

Andreas

--001a114eb4600333b705482a6ec1
Content-Type: text/x-chdr; charset=US-ASCII; name="filecontentindexer.h"
Content-Disposition: attachment; filename="filecontentindexer.h"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iyznpi7l0

LyoKICogQ29weXJpZ2h0IChDKSAyMDE1ICBWaXNoZXNoIEhhbmRhIDx2aGFuZGFAa2RlLm9yZz4K
ICoKICogVGhpcyBsaWJyYXJ5IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRl
IGl0IGFuZC9vcgogKiBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgTGVzc2Vy
IEdlbmVyYWwgUHVibGljCiAqIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3
YXJlIEZvdW5kYXRpb247IGVpdGhlcgogKiB2ZXJzaW9uIDIuMSBvZiB0aGUgTGljZW5zZSwgb3Ig
KGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KICoKICogVGhpcyBsaWJyYXJ5IGlz
IGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCiAqIGJ1dCBX
SVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9m
CiAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4g
IFNlZSB0aGUgR05VCiAqIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRl
dGFpbHMuCiAqCiAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBM
ZXNzZXIgR2VuZXJhbCBQdWJsaWMKICogTGljZW5zZSBhbG9uZyB3aXRoIHRoaXMgbGlicmFyeTsg
aWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZQogKiBGb3VuZGF0aW9uLCBJbmMuLCA1
MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BICAwMjExMC0xMzAxICBV
U0EKICoKICovCgojaWZuZGVmIEJBTE9PX0ZJTEVDT05URU5USU5ERVhFUl9ICiNkZWZpbmUgQkFM
T09fRklMRUNPTlRFTlRJTkRFWEVSX0gKCiNpbmNsdWRlIDxRUnVubmFibGU+CiNpbmNsdWRlIDxR
T2JqZWN0PgojaW5jbHVkZSA8UUF0b21pY0ludD4KI2luY2x1ZGUgPFFTdHJpbmdMaXN0PgoKI2lu
Y2x1ZGUgPFFEQnVzU2VydmljZVdhdGNoZXI+CiNpbmNsdWRlIDxRREJ1c01lc3NhZ2U+CiNpbmNs
dWRlICJmaWxlaW5kZXhlcmNvbmZpZy5oIgoKbmFtZXNwYWNlIEJhbG9vIHsKCmNsYXNzIEZpbGVD
b250ZW50SW5kZXhlclByb3ZpZGVyOwoKY2xhc3MgRmlsZUNvbnRlbnRJbmRleGVyIDogcHVibGlj
IFFPYmplY3QsIHB1YmxpYyBRUnVubmFibGUKewogICAgUV9PQkpFQ1QKICAgIFFfQ0xBU1NJTkZP
KCJELUJ1cyBJbnRlcmZhY2UiLCAib3JnLmtkZS5iYWxvby5maWxlaW5kZXhlciIpCgogICAgUV9Q
Uk9QRVJUWShRU3RyaW5nIGN1cnJlbnRGaWxlIFJFQUQgY3VycmVudEZpbGUgTk9USUZZIHN0YXJ0
ZWRJbmRleGluZ0ZpbGUpCnB1YmxpYzoKICAgIEZpbGVDb250ZW50SW5kZXhlcihGaWxlSW5kZXhl
ckNvbmZpZyogY29uZmlnLCBGaWxlQ29udGVudEluZGV4ZXJQcm92aWRlciogcHJvdmlkZXIsIFFP
YmplY3QqIHBhcmVudCA9IG51bGxwdHIpOwoKICAgIFFTdHJpbmcgY3VycmVudEZpbGUoKSB7IHJl
dHVybiBtX2N1cnJlbnRGaWxlOyB9CgogICAgdm9pZCBydW4oKSBRX0RFQ0xfT1ZFUlJJREU7Cgog
ICAgdm9pZCBxdWl0KCkgewogICAgICAgIG1fc3RvcC5zdG9yZSh0cnVlKTsKICAgIH0KCnB1Ymxp
YyBRX1NMT1RTOgogICAgUV9TQ1JJUFRBQkxFIHZvaWQgcmVnaXN0ZXJNb25pdG9yKGNvbnN0IFFE
QnVzTWVzc2FnZSYgbWVzc2FnZSk7CiAgICBRX1NDUklQVEFCTEUgdm9pZCB1bnJlZ2lzdGVyTW9u
aXRvcihjb25zdCBRREJ1c01lc3NhZ2UmIG1lc3NhZ2UpOwoKUV9TSUdOQUxTOgogICAgUV9TQ1JJ
UFRBQkxFIHZvaWQgc3RhcnRlZEluZGV4aW5nRmlsZShjb25zdCBRU3RyaW5nJiBmaWxlUGF0aCk7
CiAgICBRX1NDUklQVEFCTEUgdm9pZCBmaW5pc2hlZEluZGV4aW5nRmlsZShjb25zdCBRU3RyaW5n
JiBmaWxlUGF0aCk7CgogICAgdm9pZCBkb25lKCk7CiAgICB2b2lkIG5ld0JhdGNoVGltZSh1aW50
IHRpbWUpOwoKcHJpdmF0ZSBRX1NMT1RTOgogICAgdm9pZCBtb25pdG9yQ2xvc2VkKGNvbnN0IFFT
dHJpbmcmIHNlcnZpY2UpOwogICAgdm9pZCBzbG90U3RhcnRlZEluZGV4aW5nRmlsZShjb25zdCBR
U3RyaW5nJiBmaWxlUGF0aCk7CiAgICB2b2lkIHNsb3RGaW5pc2hlZEluZGV4aW5nRmlsZShjb25z
dCBRU3RyaW5nJiBmaWxlUGF0aCk7Cgpwcml2YXRlOgogICAgRmlsZUluZGV4ZXJDb25maWcgKm1f
Y29uZmlnOwogICAgdWludCBtX2JhdGNoU2l6ZTsKICAgIEZpbGVDb250ZW50SW5kZXhlclByb3Zp
ZGVyKiBtX3Byb3ZpZGVyOwoKICAgIFFBdG9taWNJbnQgbV9zdG9wOwoKICAgIFFTdHJpbmcgbV9j
dXJyZW50RmlsZTsKCiAgICBRU3RyaW5nTGlzdCBtX3JlZ2lzdGVyZWRNb25pdG9yczsKICAgIFFE
QnVzU2VydmljZVdhdGNoZXIgbV9tb25pdG9yV2F0Y2hlcjsKfTsKCn0KCiNlbmRpZiAvLyBCQUxP
T19GSUxFQ09OVEVOVElOREVYRVJfSAo=

--001a114eb4600333b705482a6ec1--
