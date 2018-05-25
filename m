Return-Path: <dylan.bartlett@metixmedical.co.uk>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6151F6FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 09:31:10 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id e20-v6so6059982itc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 02:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=metixmedical-co-uk.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=4RFZXf/89JmDDFW5lE7A2qfH5H5PHBJH4LoLv0wN4Ec=;
	b=sjtgbtg8kwy6MrB2GCnEDKl53zjXBD24R9FZ1qh8vzDN2um3ml8qm3fgVw2mic0rRX
	DvA8bkW1UIbqiVY2herzqfW9ITntTrkRfkNSXuvN1RBj9VvO5sf4dB0dePo5rYIQgk4c
	bq4WIKxsrJkOCV0ghd8kEKDZMSBdlZcAljNONm7hd6ZqZcQq6eA2Ov0ve9/TrgixHgVS
	kadnk0iuGt97Rkdz947yJHSpb83SSI7Vqa3JnfuM/51eB6eQJfvphFdn7wGAcB7ZTNax
	+pnlT6t8IL/S8EVQO2XB5AW35twx3lmiLYhA8vD1UBVNWEkuao83+7jaMgO6VtpdIuFw
	qJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=4RFZXf/89JmDDFW5lE7A2qfH5H5PHBJH4LoLv0wN4Ec=;
	b=CZToQUElGc/wLiTRXT1HTwgynyqCQ2tS+sGdYnLYgnT3oyzPqqwutRZ0BWTt7/mpay
	SVgTXwN2i7Fll1+zQb4JtnfBsik0BU7gfIE0++UGHGGcZmXFVGgzsOIENhnNosXBcuNe
	h1UjWJlD2WrMJz2YNIlK6mbEImot76aQVKtluVfK+cBG8XjfLbPONKgb9Byqsee7kmgY
	uNfwN80fUvbl5NLqxc1jurG9IrxDY6XHYB5IBnTLkVJKsTNZj8nhUjMg+5ck1L+X6dgS
	vwac3TnU0Xrrv99whpob792qtQTswCQlE86wuwA33Avp2u0B4wcOfoz4hlnz0XyZ6N8O
	ArNw==
X-Gm-Message-State: ALKqPwd0vRg9hASELUBBoox5sAD33xfAKAjak4IPXT5jcJ/MUmo4Vylv
	+IP7h++W8SS5rja6ZeoS/lh+Uqa6sgkLwreDzW5JS+Wy
X-Google-Smtp-Source: ADUXVKLU6D900JRd7m/g9N0DphobMxhvm+Ya4tOFmmQejLKRxi8L77m7lgCDscse8XuIZcUiqw1nqVtIWUXF459P+7A=
X-Received: by 2002:a24:414c:: with SMTP id
	x73-v6mr1201645ita.96.1527240671811; 
	Fri, 25 May 2018 02:31:11 -0700 (PDT)
MIME-Version: 1.0
From: Dylan Bartlett <dylan.bartlett@metixmedical.co.uk>
Date: Fri, 25 May 2018 10:31:02 +0100
Message-ID: <CAFuZ8QBXvZ57MKzbwEkQ40mnYXMGLi4PaTM1TR=SKqJarQwuVQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] Do_install_append() with qmake
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
X-List-Received-Date: Fri, 25 May 2018 09:31:11 -0000
X-Groupsio-MsgNum: 72427
Content-Type: multipart/mixed; boundary="000000000000bb2dd7056d046d7d"

--000000000000bb2dd7056d046d7d
Content-Type: text/plain; charset="UTF-8"

Hello all,

I hope you'll be able to help clear some things up for me.

I have created a recipe to build and install a Qt Application I've been
developing, so far everything has been working great and the program gets
compiled, installed and packaged.

However there is one additional install step I need to complete, which is
creating a symbolic link to my binary in /opt to /usr/bin/b2qt. I want to
do this so that the Boot2Qt appcontroller starts my application on boot.

There are two ways I thought I could do this.
1. Use do_install_append() in the recipe to create the symbolic link.
However qmake5.bbclass does not export the do_install function. Modifying
the .bbclass with EXPORT_FUNCTIONS do_install breaks everything so I think
that this is the wrong way to go about it.

2. Use target.extra in the qmake .pro file to add the extra commands.
This one I had a bit more success with, I added my commands to target.extra
and built the recipe.
In this case do_install appeared to run properly. I could see my symbolic
link in the image directory however the binary that was complied no longer
appears in the image directory. So I've fixed one thing and broke another.

At this point I've reached the end of what I think I can try, I'm sure I'm
missing something simple since extra install steps are a common task. Can
someone tell me what the canonically correct way that I should be doing
this is?

I've attached my recipe and a segment of my .pro if that helps.

Best Regards,
Dylan Bartlett

--000000000000bb2dd7056d046d7d
Content-Type: text/plain; charset="US-ASCII"; name="project.pro.txt"
Content-Disposition: attachment; filename="project.pro.txt"
Content-Transfer-Encoding: base64
Content-ID: <16396a303c77caf71da1>
X-Attachment-Id: 16396a303c77caf71da1

I0RlZmluZSB3aGVyZSBmaWxlcyBzaG91bGQgYmUgaW5zdGFsbGVkLiBDcmVhdGUgYjJxdCBzeW1s
aW5rIHRvIGxhdW5jaCBvbiBib290Lg0KdGFyZ2V0LnBhdGggPSAvb3B0LyQke1RBUkdFVH0vYmlu
DQojdGFyZ2V0LmV4dHJhID0gbWtkaXIgLXAgIiQoSU5TVEFMTF9ST09UKS91c3IvYmluLyIgJiYg
bG4gLXNmciAvb3B0LyQke1RBUkdFVH0vYmluLyQke1RBUkdFVH0gIiQoSU5TVEFMTF9ST09UKS91
c3IvYmluL2IycXQiDQpJTlNUQUxMUyAgICs9IHRhcmdldA==

--000000000000bb2dd7056d046d7d
Content-Type: text/plain; charset="US-ASCII"; name="stoke_git.bb.txt"
Content-Disposition: attachment; filename="stoke_git.bb.txt"
Content-Transfer-Encoding: base64
Content-ID: <16396a30c4d4f9125f52>
X-Attachment-Id: 16396a30c4d4f9125f52

IyBSZWNpcGUgY3JlYXRlZCBieSByZWNpcGV0b29sCiMgVGhpcyBpcyB0aGUgYmFzaXMgb2YgYSBy
ZWNpcGUgYW5kIG1heSBuZWVkIGZ1cnRoZXIgZWRpdGluZyBpbiBvcmRlciB0byBiZSBmdWxseSBm
dW5jdGlvbmFsLgojIChGZWVsIGZyZWUgdG8gcmVtb3ZlIHRoZXNlIGNvbW1lbnRzIHdoZW4gZWRp
dGluZy4pCgojIFdBUk5JTkc6IHRoZSBmb2xsb3dpbmcgTElDRU5TRSBhbmQgTElDX0ZJTEVTX0NI
S1NVTSB2YWx1ZXMgYXJlIGJlc3QgZ3Vlc3NlcyAtIGl0IGlzCiMgeW91ciByZXNwb25zaWJpbGl0
eSB0byB2ZXJpZnkgdGhhdCB0aGUgdmFsdWVzIGFyZSBjb21wbGV0ZSBhbmQgY29ycmVjdC4KIwoj
IFRoZSBmb2xsb3dpbmcgbGljZW5zZSBmaWxlcyB3ZXJlIG5vdCBhYmxlIHRvIGJlIGlkZW50aWZp
ZWQgYW5kIGFyZQojIHJlcHJlc2VudGVkIGFzICJVbmtub3duIiBiZWxvdywgeW91IHdpbGwgbmVl
ZCB0byBjaGVjayB0aGVtIHlvdXJzZWxmOgojICAgZGVwZW5kZW5jaWVzL1F0QXdlc29tZS9MSUNF
TlNFLm1kCiMKTElDRU5TRSA9ICJQcm9wcmlldGFyeSIKTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRTttZDU9Y2ZkYTY4M2JlYzk1MDgyYTEyYzMyNTY4ZWYwOWQxNDQiCgpTUkNfVVJJ
ID0gImdpdDovL2dpdEBnaXRsYWIuY29tL3JlZGFjdGVkLmdpdDtwcm90b2NvbD1zc2g7YnJhbmNo
PW1hc3Rlci1zaW11bGF0aW9uLXlvY3RvbW9kcyIKCiMgTW9kaWZ5IHRoZXNlIGFzIGRlc2lyZWQK
UFYgPSAiMS4wK2dpdCR7U1JDUFZ9IgpTUkNSRVYgPSAiZWRhMDAzODIyZjdiZjA4Njg0ODIwOTc5
MDJlNGMwZWNjYzIxMzgwMyIKClMgPSAiJHtXT1JLRElSfS9naXQiCkQgPSAiJHtXT1JLRElSfS9p
bWFnZXMiCmluaGVyaXQgcW1ha2U1CgpGSUxFU18ke1BOfSArPSAiL29wdC9tZXRpeC13Zy11aS9i
aW4vbWV0aXgtd2ctdWkgXCIKCiNUaGlzIGRvZXNuJ3Qgd29yayB3aXRoIHFtYWtlCiNkb19pbnN0
YWxsX2FwcGVuZCgpIHsKIwlsbiAtc2ZyIC9vcHQvJCR7VEFSR0VUfS9iaW4vJCR7VEFSR0VUfSAi
JHtEfS91c3IvYmluL2IycXQiCiN9

--000000000000bb2dd7056d046d7d--
