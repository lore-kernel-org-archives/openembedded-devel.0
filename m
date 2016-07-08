Return-Path: <kevron.m.rees@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id E2E4A60119
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jul 2016 17:48:31 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id i186so48196348iof.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2016 10:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=EHZlC99BmTm+fSopC97uNp0/gAU4JypqVP+NrAJp3ds=;
	b=IYn+zq0t/mq8PM6TePxn//fIu+gNkvSz0nDb0eKDRKOc/pKOtT8A49KxTPNXhoI+gN
	AuBGyxZr35ealw4TBaVdnY9raxpMUoCMV39N2qBVOCoW0NwuP3A/qJLCb+zObUQAODJC
	Q33H25lRFs33sanWmLrEFSpmv8XLixBsfFAmf/CzyJ4yLFI6TZ2hJKu5SHkYLUQjKMpD
	PB7Xllgz9luh924udfdvr6SwLqIsnPt29+Dt0//p1xlt9/A9CAgwN9tfQDyBBEEAScxF
	njY4JCqpzQKPxvc6d186JMHLU6iVkvVLrynypAjU42+iaQKOGgHW5Y1Ly8XYYoH1ArfR
	G+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=EHZlC99BmTm+fSopC97uNp0/gAU4JypqVP+NrAJp3ds=;
	b=fFYIdSYZnDm7AhAiuaMsh2sTjhzF2JkmA/h7x/Fxn5I2Vx2O8b14PbasfAeh6wfp7d
	09+L/r5QiHeGT9cTbSWm/SUptRIXRAay0VGIyc+UIuUoHGorSzP2kicEA6riGulfcNgS
	kTL7OyDwYbYCKsRK5irQCioKnuslNeKN9Z/lKlb5kUIcIpbOeDLa7eHgxzkrEj34x4Z3
	gfBUgs/TlfmGMWcuzboKZAYnNiGCkMc1qcUObdi+Ttx+W6es4jEokwlx9e3WcRMHwbB8
	f5j4Mq99sZRBnazw9RkRhJqWNzu3WdDt1ySusaDPnI0b7e0iWLg7XBM9athtfPIZ3Sj4
	UgYA==
X-Gm-Message-State: ALyK8tKvzg5wdmcXiSzZvNi3q4CoW/msasW7nR9dKtZ1k9TGvTguYB2kUbgWXvpwLeuQowDXYupSiiADWoiOpjTA
X-Received: by 10.107.164.70 with SMTP id n67mr9842979ioe.105.1468000111856;
	Fri, 08 Jul 2016 10:48:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.74.226 with HTTP; Fri, 8 Jul 2016 10:48:31 -0700 (PDT)
From: "Rees, Kevron" <kevron.m.rees@intel.com>
Date: Fri, 8 Jul 2016 10:48:31 -0700
Message-ID: <CAFW5wYaH1+fQbhB3=+pwA-ujUvfFrhRZ-pKPSBZZh2gL9tm-_w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java] restore old way of setting cflags, etc in build
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
X-List-Received-Date: Fri, 08 Jul 2016 17:48:32 -0000
X-Groupsio-MsgNum: 62076
Content-Type: multipart/mixed; boundary=001a114289f232f5920537236989

--001a114289f232f5920537236989
Content-Type: text/plain; charset=UTF-8

The new way breaks building for us.  This attached patch restores old
method of setting cflags so building works.

--001a114289f232f5920537236989
Content-Type: text/x-patch; charset=US-ASCII; name="set-cflags.patch"
Content-Disposition: attachment; filename="set-cflags.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iqe1anag0

Y29tbWl0IGZmMmZmODNjMDM4N2E5MzU5OTc0M2U4OWM5ZDJkMjM2N2NhNDE0NTQKQXV0aG9yOiBL
ZXZyb24gUmVlcyA8dHJpcHplcm8ua2V2QGdtYWlsLmNvbT4KRGF0ZTogICBUaHUgSnVsIDcgMTI6
NDI6MzMgMjAxNiAtMDcwMAoKICAgIFtpY2V0ZWEvb3Blbmpka10gcmV2ZXJ0IHRvIG9sZCBtZXRo
b2Qgb2Ygc2V0dGluZyBDRkxBR1MKICAgIAogICAgTmV3IG1ldGhvZCBzZWVtcyB0byBicmVhayBi
dWlsZGluZyAtYXMgaWYgYnVpbGQgc3lzdGVtIGlzIGlnbm9yaW5nCiAgICB0aGUgbmV3IGZsYWdz
LiAgVGhlIG5ldyBhbmQgb2xkIG1ldGhvZHMgY2FuIHdvcmsgdG9nZXRoZXIuCiAgICAKICAgIFNp
Z25lZC1vZmYtYnk6IEtldnJvbiBSZWVzIDx0cmlwemVyby5rZXZAZ21haWwuY29tPgoKZGlmZiAt
LWdpdCBhL3JlY2lwZXMtY29yZS9vcGVuamRrL29wZW5qZGstOC1jcm9zcy5pbmMgYi9yZWNpcGVz
LWNvcmUvb3Blbmpkay9vcGVuamRrLTgtY3Jvc3MuaW5jCmluZGV4IDExZTk0Y2UuLjY2MmM2M2Yg
MTAwNjQ0Ci0tLSBhL3JlY2lwZXMtY29yZS9vcGVuamRrL29wZW5qZGstOC1jcm9zcy5pbmMKKysr
IGIvcmVjaXBlcy1jb3JlL29wZW5qZGsvb3Blbmpkay04LWNyb3NzLmluYwpAQCAtODQsNiArODQs
MTAgQEAgZXhwb3J0IE1GTEFHUz0iJHtAamRrX21ha2Vfb3B0aW9ucyhkKX0gTUFLRV9WRVJCT1NF
PXkgUVVJRVRMWT0gVkVSQk9TRT0tcyBMT0dfTEUKIEJVSUxEX0xEPSIke0JVSUxEX0NDTER9Igog
CiBFWFRSQV9PRU1BS0VfYXBwZW5kID0gJ1wKKyAgICBPRV9DRkxBR1M9IiR7Q0ZMQUdTfSIgXAor
ICAgIE9FX0NQUEZMQUdTPSIke0NQUEZMQUdTfSIgXAorICAgIE9FX0NYWEZMQUdTPSIke0NYWEZM
QUdTfSIgXAorICAgIE9FX0xERkxBR1M9IiR7TERGTEFHU30iIFwKICAgICAke0BqZGtfbWFrZV9v
cHRpb25zKGQpfSBcCiAgICAgQUxUX1NEVF9IPSIke1NUQUdJTkdfSU5DRElSfSIgXAogICAgIEFM
VF9DVVBTX0hFQURFUlNfUEFUSD0iJHtTVEFHSU5HX0lOQ0RJUn0iIFwKZGlmZiAtLWdpdCBhL3Jl
Y2lwZXMtY29yZS9vcGVuamRrL29wZW5qZGstOC1uYXRpdmUuaW5jIGIvcmVjaXBlcy1jb3JlL29w
ZW5qZGsvb3Blbmpkay04LW5hdGl2ZS5pbmMKaW5kZXggOTEwODBkMi4uZjhhMmFkMSAxMDA2NDQK
LS0tIGEvcmVjaXBlcy1jb3JlL29wZW5qZGsvb3Blbmpkay04LW5hdGl2ZS5pbmMKKysrIGIvcmVj
aXBlcy1jb3JlL29wZW5qZGsvb3Blbmpkay04LW5hdGl2ZS5pbmMKQEAgLTQxLDYgKzQxLDEwIEBA
IGV4cG9ydCBNQUtFX1ZFUkJPU0UgPSAieSIKIGV4cG9ydCBNRkxBR1M9IiR7QGpka19tYWtlX29w
dGlvbnMoZCl9IE1BS0VfVkVSQk9TRT15IFFVSUVUTFk9IFZFUkJPU0U9LXMgTE9HX0xFVkVMPXRy
YWNlIgogCiBFWFRSQV9PRU1BS0VfYXBwZW5kID0gJyBcCisgICAgT0VfQ0ZMQUdTPSIke0NGTEFH
U30iIFwKKyAgICBPRV9DUFBGTEFHUz0iJHtDUFBGTEFHU30iIFwKKyAgICBPRV9DWFhGTEFHUz0i
JHtDWFhGTEFHU30iIFwKKyAgICBPRV9MREZMQUdTPSIke0xERkxBR1N9IiBcCiAgICAgJHtAamRr
X21ha2Vfb3B0aW9ucyhkKX0gXAogICAgIE1BS0VfVkVSQk9TRT15IFZFUkJPU0U9LXMgTE9HX0xF
VkVMPXRyYWNlIFwKICAgICBRVUlFVExZPSBcCg==

--001a114289f232f5920537236989--
