Return-Path: <bak2132@columbia.edu>
Received: from tarap.cc.columbia.edu (tarap.cc.columbia.edu [128.59.29.7])
	by mail.openembedded.org (Postfix) with ESMTP id D6DE56B215
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2013 17:37:33 +0000 (UTC)
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by tarap.cc.columbia.edu (8.14.4/8.14.3) with ESMTP id r6GHbUCM016154
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2013 13:37:30 -0400 (EDT)
Received: by mail-vc0-f177.google.com with SMTP id hv10so649521vcb.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2013 10:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=03l21k7TA9jZPO94tCHtRVy0/1VqEspCgFqQz6xhcYY=;
	b=mKGEy4wEg89WG6IjFNUSJJVW1z20ClNfYZ10PckRNy0uGvTLQzSzsbcbBxzWxhI4Vh
	TAxWbHV+rPAwVtOIHpJtlFxtb58+xdpd7G4Pypu+N48rQL9Yso4Be8fey2iRTfJjaQq5
	y0X535JtdkW2YsYJB1+YKn4sENGhsrfs9nHqK3BHMjQkfg7HKn+ADZaCLjtZo7DvhYx4
	V9LTaeDXiWw0WoxpgCTnyMsn2gWfK6Xpi8VGOG69TOEDSvW/C91fzT+YgKQn/+krR7R2
	KKAeC4zrT8brbtgKEZo4xazACeXc9jJvlZ1qbb0ub/hBPv6HLyG5uzI0IvvFLkDVOJ9T
	OG2Q==
X-Received: by 10.52.66.49 with SMTP id c17mr655686vdt.94.1373996249984;
	Tue, 16 Jul 2013 10:37:29 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.52.66.49 with SMTP id c17mr655682vdt.94.1373996249838; Tue,
	16 Jul 2013 10:37:29 -0700 (PDT)
Received: by 10.220.183.196 with HTTP; Tue, 16 Jul 2013 10:37:29 -0700 (PDT)
Date: Tue, 16 Jul 2013 13:37:29 -0400
Message-ID: <CANS_96Zyg_YLS0zXpf8vuHHSDcWMFwPzRMqSwRpzjBWSLvwBQw@mail.gmail.com>
From: Brian Kelly <bak2132@columbia.edu>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlkS0Z40uct2GJJWTp5ZIZnaVj7j98GsEUD15UNlL2mx31t1A+Vu3+Ax3F+OKB1JR/uRWeLrfZ8m9DSHdg0fBtaJq6vpzxSsCiQ6YIE2XqH1oZ6WbalUPaG5pSydGtowR4uWlb/Q47mi4XNGcfVN/roHGDOLGtjkayjY1R9fzW0qlS6M8QJKtd1pL4IHEIjMSYQHArp
X-No-Spam-Score: Local
X-Scanned-By: MIMEDefang 2.68 on 128.59.29.7
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Cross-Compilation of ROOT for ARM machine
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
X-List-Received-Date: Tue, 16 Jul 2013 17:37:34 -0000
X-Groupsio-MsgNum: 45389
Content-Type: multipart/mixed; boundary=20cf3071d00a6509e204e1a46edc

--20cf3071d00a6509e204e1a46edc
Content-Type: text/plain; charset=ISO-8859-1

Hello OpemEmbedded Community:

I am trying to compile the Root library (ver. 5.34.09) for an arm machine
(i.e. a gumstix verdex XL6P running the Angstrom linux distribution (a
computer-on-module)). I attempted native compilation but I kept getting an
internal error in the compiler program, which led to suspect that there was
not enough memory for the library to compile (this is most likely the case
since the library compiled fine on a debian arm emulation using qemu).

Now I am attempting to the bitbake software. I followed the instructions on
the website http://wiki.gumstix.org/index.php?title=Verdex_Git_Repository to
create a working bitbake environment and verdex image was created
successfully.


Now I am trying to create a recipe that will allow me to run Root.
Supposedly the libraries have been built successfully but the installation
on the gumstix fails (see attachment).

I have attached my work so far (my recipe, the terminal output from the
computer I am running bitbake on and the terminal output from my gumstix)
and, since I am quite inexperienced with bitbake, I would greatly appreciate
any constructive feedback that will help me get the Root library working on
the gumstix.

Thank you very much in for any help that you may provide.

Regards,
V. Satire Cat

--20cf3071d00a6509e204e1a46edc
Content-Type: text/plain; charset=US-ASCII; name="root_5.34.9.bb.txt"
Content-Disposition: attachment; filename="root_5.34.9.bb.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hj7dudih0

UFIgPSAicjAiCiAKU1JDX1VSSSA9ICJmdHA6Ly9yb290LmNlcm4uY2gvcm9vdC9yb290X3Y1LjM0
LjA5LnNvdXJjZS50YXIuZ3oiCgpkb19pbnN0YWxsKCl7CiAgICAgICAgaW5zdGFsbCAtbSAwNzU1
IC1kICR7RH0ke2JpbmRpcn0gJHtEfSR7ZG9jZGlyfS9yb290CiB9CiAKaW5oZXJpdCBhdXRvdG9v
bHMK

--20cf3071d00a6509e204e1a46edc
Content-Type: text/plain; charset=US-ASCII; name="gumstix_output.txt"
Content-Disposition: attachment; filename="gumstix_output.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hj7duhhc1

W3Jvb3RAZ3Vtc3RpeC12ZXJkZXggfl0KPm9wa2cgaW5zdGFsbCByb290LWRldl81LjM0LjktcjBf
YXJtdjV0ZS5pcGsKSW5zdGFsbGluZyByb290LWRldiAoNS4zNC45LXIwKSB0byByb290Li4uCkNv
bmZpZ3VyaW5nIGRlYmlhbnV0aWxzLgp1cGRhdGUtYWx0ZXJuYXRpdmVzOiBMaW5raW5nIC8vdXNy
L3NiaW4vYWRkLXNoZWxsIHRvIGFkZC1zaGVsbC5kZWJpYW51dGlscwp1cGRhdGUtYWx0ZXJuYXRp
dmVzOiBMaW5raW5nIC8vdXNyL3NiaW4vaW5zdGFsbGtlcm5lbCB0byBpbnN0YWxsa2VybmVsLmRl
YmlhbnV0aWxzCnVwZGF0ZS1hbHRlcm5hdGl2ZXM6IExpbmtpbmcgLy91c3Ivc2Jpbi9ta2Jvb3Qg
dG8gbWtib290LmRlYmlhbnV0aWxzCnVwZGF0ZS1hbHRlcm5hdGl2ZXM6IExpbmtpbmcgLy91c3Iv
c2Jpbi9yZW1vdmUtc2hlbGwgdG8gcmVtb3ZlLXNoZWxsLmRlYmlhbnV0aWxzCnVwZGF0ZS1hbHRl
cm5hdGl2ZXM6IExpbmtpbmcgLy91c3IvYmluL3NhdmVsb2cgdG8gc2F2ZWxvZy5kZWJpYW51dGls
cwp1cGRhdGUtYWx0ZXJuYXRpdmVzOiBMaW5raW5nIC8vdXNyL2Jpbi9zZW5zaWJsZS1icm93c2Vy
IHRvIHNlbnNpYmxlLWJyb3dzZXIuZGViaWFudXRpbHMKdXBkYXRlLWFsdGVybmF0aXZlczogTGlu
a2luZyAvL3Vzci9iaW4vc2Vuc2libGUtZWRpdG9yIHRvIHNlbnNpYmxlLWVkaXRvci5kZWJpYW51
dGlscwp1cGRhdGUtYWx0ZXJuYXRpdmVzOiBMaW5raW5nIC8vdXNyL2Jpbi9zZW5zaWJsZS1wYWdl
ciB0byBzZW5zaWJsZS1wYWdlci5kZWJpYW51dGlscwp1cGRhdGUtYWx0ZXJuYXRpdmVzOiBMaW5r
aW5nIC8vdXNyL2Jpbi93aGljaCB0byB3aGljaC5kZWJpYW51dGlscwp1cGRhdGUtYWx0ZXJuYXRp
dmVzOiBMaW5raW5nIC8vYmluL3J1bi1wYXJ0cyB0byBydW4tcGFydHMuZGViaWFudXRpbHMKdXBk
YXRlLWFsdGVybmF0aXZlczogRXJyb3I6IGNhbm5vdCByZWdpc3RlciBhbHRlcm5hdGl2ZSB0ZW1w
ZmlsZSB0byAvYmluL3RlbXBmaWxlIHNpbmNlIGl0IGlzIGFscmVhZHkgcmVnaXN0ZXJlZCB0byAv
dXNyL2Jpbi90ZW1wZmlsZQpDb25maWd1cmluZyByb290LWRldi4KQ29sbGVjdGVkIGVycm9yczoK
ICogcGtnX3J1bl9zY3JpcHQ6IHBvc3RpbnN0IHNjcmlwdCByZXR1cm5lZCBzdGF0dXMgMS4KICog
b3BrZ19jb25maWd1cmU6IGRlYmlhbnV0aWxzLnBvc3RpbnN0IHJldHVybmVkIDEuCltyb290QGd1
bXN0aXgtdmVyZGV4IH5dCj5yb290Ci1iYXNoOiAvYmluL3Jvb3Q6IGNhbm5vdCBleGVjdXRlIGJp
bmFyeSBmaWxlCgo=

--20cf3071d00a6509e204e1a46edc
Content-Type: text/plain; charset=US-ASCII; name="bitbake_output.txt"
Content-Disposition: attachment; filename="bitbake_output.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hj7duki22

dXNlckBjb21wdXRlcjp+L3ZlcmRleC1vZS9vcmcub3BlbmVtYmVkZGVkLmRldi9yZWNpcGVzL3Jv
b3RfNS4zNC45JCBiaXRiYWtlIC1iIHJvb3RfNS4zNC45LmJiCk5PVEU6IHBhY2thZ2Ugcm9vdC01
LjM0Ljk6IHN0YXJ0ZWQKTk9URTogcGFja2FnZSByb290LTUuMzQuOS1yMDogdGFzayBkb19mZXRj
aDogc3RhcnRlZApOT1RFOiByb290LTUuMzQuOTogZnRwOi8vcm9vdC5jZXJuLmNoL3Jvb3Qvcm9v
dF92NS4zNC4wOS5zb3VyY2UudGFyLmd6IGhhcyBubyBlbnRyeSBpbiBjb25mL2NoZWNrc3Vtcy5p
bmksIG5vdCBjaGVja2luZyBVUkkKTk9URTogcGFja2FnZSByb290LTUuMzQuOS1yMDogdGFzayBk
b19mZXRjaDogY29tcGxldGVkCk5PVEU6IHBhY2thZ2Ugcm9vdC01LjM0LjktcjA6IHRhc2sgZG9f
dW5wYWNrOiBzdGFydGVkCk5PVEU6IFVucGFja2luZyAvdXNyL3NoYXJlL3NvdXJjZXMvcm9vdF92
NS4zNC4wOS5zb3VyY2UudGFyLmd6IHRvIC9ob21lL3VzZXIvZ3Vtc3RpeC9ndW1zdGl4LW9lL3Rt
cC93b3JrL2FybXY1dGUtYW5nc3Ryb20tbGludXgtZ251ZWFiaS9yb290LTUuMzQuOS1yMC8KTk9U
RTogcGFja2FnZSByb290LTUuMzQuOS1yMDogdGFzayBkb191bnBhY2s6IGNvbXBsZXRlZApOT1RF
OiBwYWNrYWdlIHJvb3QtNS4zNC45LXIwOiB0YXNrIGRvX3BhdGNoOiBzdGFydGVkCk5PVEU6IHBh
Y2thZ2Ugcm9vdC01LjM0LjktcjA6IHRhc2sgZG9fcGF0Y2g6IGNvbXBsZXRlZApOT1RFOiBwYWNr
YWdlIHJvb3QtNS4zNC45LXIwOiB0YXNrIGRvX2NvbmZpZ3VyZTogc3RhcnRlZApOT1RFOiBwYWNr
YWdlIHJvb3QtNS4zNC45LXIwOiB0YXNrIGRvX2NvbmZpZ3VyZTogY29tcGxldGVkCk5PVEU6IHBh
Y2thZ2Ugcm9vdC01LjM0LjktcjA6IHRhc2sgZG9fcWFfY29uZmlndXJlOiBzdGFydGVkCk5PVEU6
IENoZWNraW5nIHNhbml0eSBvZiB0aGUgY29uZmlnLmxvZyBmaWxlCk5PVEU6IHBhY2thZ2Ugcm9v
dC01LjM0LjktcjA6IHRhc2sgZG9fcWFfY29uZmlndXJlOiBjb21wbGV0ZWQKTk9URTogcGFja2Fn
ZSByb290LTUuMzQuOS1yMDogdGFzayBkb19jb21waWxlOiBzdGFydGVkCk5PVEU6IHBhY2thZ2Ug
cm9vdC01LjM0LjktcjA6IHRhc2sgZG9fY29tcGlsZTogY29tcGxldGVkCk5PVEU6IHBhY2thZ2Ug
cm9vdC01LjM0LjktcjA6IHRhc2sgZG9faW5zdGFsbDogc3RhcnRlZApOT1RFOiBwYWNrYWdlIHJv
b3QtNS4zNC45LXIwOiB0YXNrIGRvX2luc3RhbGw6IGNvbXBsZXRlZApOT1RFOiBwYWNrYWdlIHJv
b3QtNS4zNC45LXIwOiB0YXNrIGRvX3BhY2thZ2U6IHN0YXJ0ZWQKTk9URTogRE8gUEFDS0FHRSBR
QQpOT1RFOiBDaGVja2luZyBQYWNrYWdlOiByb290LWRiZwpOT1RFOiBDaGVja2luZyBQYWNrYWdl
OiByb290Ck5PVEU6IENoZWNraW5nIFBhY2thZ2U6IHJvb3QtZG9jCk5PVEU6IENoZWNraW5nIFBh
Y2thZ2U6IHJvb3QtZGV2Ck5PVEU6IENoZWNraW5nIFBhY2thZ2U6IHJvb3QtbG9jYWxlCk5PVEU6
IERPTkUgd2l0aCBQQUNLQUdFIFFBCk5PVEU6IHBhY2thZ2Ugcm9vdC01LjM0LjktcjA6IHRhc2sg
ZG9fcGFja2FnZTogY29tcGxldGVkCk5PVEU6IHBhY2thZ2Ugcm9vdC01LjM0LjktcjA6IHRhc2sg
ZG9fcGFja2FnZV93cml0ZV9pcGs6IHN0YXJ0ZWQKUGFja2FnZWQgY29udGVudHMgb2Ygcm9vdC1k
YmcgaW50byAvaG9tZS91c2VyL2d1bXN0aXgvZ3Vtc3RpeC1vZS90bXAvZGVwbG95L2dsaWJjL2lw
ay9hcm12NXRlL3Jvb3QtZGJnXzUuMzQuOS1yMF9hcm12NXRlLmlwawpOT1RFOiBOb3QgY3JlYXRp
bmcgZW1wdHkgYXJjaGl2ZSBmb3Igcm9vdC01LjM0LjktcjAKTk9URTogTm90IGNyZWF0aW5nIGVt
cHR5IGFyY2hpdmUgZm9yIHJvb3QtZG9jLTUuMzQuOS1yMApQYWNrYWdlZCBjb250ZW50cyBvZiBy
b290LWRldiBpbnRvIC9ob21lL3VzZXIvZ3Vtc3RpeC9ndW1zdGl4LW9lL3RtcC9kZXBsb3kvZ2xp
YmMvaXBrL2FybXY1dGUvcm9vdC1kZXZfNS4zNC45LXIwX2FybXY1dGUuaXBrCk5PVEU6IE5vdCBj
cmVhdGluZyBlbXB0eSBhcmNoaXZlIGZvciByb290LWxvY2FsZS01LjM0LjktcjAKTk9URTogcGFj
a2FnZSByb290LTUuMzQuOS1yMDogdGFzayBkb19wYWNrYWdlX3dyaXRlX2lwazogY29tcGxldGVk
Ck5PVEU6IHBhY2thZ2Ugcm9vdC01LjM0LjktcjA6IHRhc2sgZG9fcGFja2FnZV93cml0ZTogc3Rh
cnRlZApOT1RFOiBwYWNrYWdlIHJvb3QtNS4zNC45LXIwOiB0YXNrIGRvX3BhY2thZ2Vfd3JpdGU6
IGNvbXBsZXRlZApOT1RFOiBwYWNrYWdlIHJvb3QtNS4zNC45LXIwOiB0YXNrIGRvX3BvcHVsYXRl
X3N0YWdpbmc6IHN0YXJ0ZWQKTk9URTogcGFja2FnZSByb290LTUuMzQuOS1yMDogdGFzayBkb19w
b3B1bGF0ZV9zdGFnaW5nOiBjb21wbGV0ZWQKTk9URTogcGFja2FnZSByb290LTUuMzQuOS1yMDog
dGFzayBkb19xYV9zdGFnaW5nOiBzdGFydGVkCk5PVEU6IFFBIGNoZWNraW5nIHN0YWdpbmcKRVJS
T1I6IFFBIGlzc3VlOiBsaWJtdWRmbGFwdGgubGEgZmFpbGVkIHNhbml0eSB0ZXN0IChyZWZlcmVu
Y2UgdG8gd29ya2RpciBvciBpbnN0YWxsZWQpCkVSUk9SOiBRQSBpc3N1ZTogbGlic3RkYysrLmxh
IGZhaWxlZCBzYW5pdHkgdGVzdCAocmVmZXJlbmNlIHRvIHdvcmtkaXIgb3IgaW5zdGFsbGVkKQpF
UlJPUjogUUEgaXNzdWU6IGxpYm11ZGZsYXAubGEgZmFpbGVkIHNhbml0eSB0ZXN0IChyZWZlcmVu
Y2UgdG8gd29ya2RpciBvciBpbnN0YWxsZWQpCkVSUk9SOiBRQSBpc3N1ZTogbGlic3VwYysrLmxh
IGZhaWxlZCBzYW5pdHkgdGVzdCAocmVmZXJlbmNlIHRvIHdvcmtkaXIgb3IgaW5zdGFsbGVkKQpO
T1RFOiBwYWNrYWdlIHJvb3QtNS4zNC45LXIwOiB0YXNrIGRvX3FhX3N0YWdpbmc6IGNvbXBsZXRl
ZApOT1RFOiBwYWNrYWdlIHJvb3QtNS4zNC45LXIwOiB0YXNrIGRvX2J1aWxkOiBzdGFydGVkCk5P
VEU6IHBhY2thZ2Ugcm9vdC01LjM0LjktcjA6IHRhc2sgZG9fYnVpbGQ6IGNvbXBsZXRlZApOT1RF
OiBwYWNrYWdlIHJvb3QtNS4zNC45OiBjb21wbGV0ZWQK

--20cf3071d00a6509e204e1a46edc--
