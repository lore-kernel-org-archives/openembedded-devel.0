Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NKOo2-0007MJ-Vm
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Dec 2009 05:14:42 +0100
Received: by yxe5 with SMTP id 5so3449156yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2009 20:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:date:subject
	:mime-version:from:organization:message-id:user-agent;
	bh=RyyGJJRv03wxewKGo0mE7FBBIMVkq0Y/Ay0a0PfEbJQ=;
	b=Im/X/o7ZNO/c2zi48Hlh1J8i9WGt9mu3e6jAx/QeZfFjLcDezfdElXB5UL6ayBzjkT
	8u/VeM8+TXk+9Qhk4OI9bGTgYaHOyizCVH1FoVyBmZ0mTuw1ZSQWpW6Ysdt+Kn6nfAFq
	VL/MPT0wC71Prjdz1gSx0KcWW437Yxon3Iz48=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:date:subject:mime-version:from:organization
	:message-id:user-agent;
	b=ec+VfoeUmu6y5bLIp64MEtbyXyR6cornSUQz3afn3D8vvewrBRqd9grt8rV0P1aa2b
	9pMiKeqrXkcNcJaIKd2XRQdbwRQPxCM1QonGAh9/m9l7qlNn3YbE5k57u6nohVN5YdnN
	BzwfEgiaPfc07XvBDTYV8qU7RjiEttw7j0s8o=
Received: by 10.151.116.8 with SMTP id t8mr8807853ybm.48.1260850372493;
	Mon, 14 Dec 2009 20:12:52 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.68.164])
	by mx.google.com with ESMTPS id 6sm1815674ywc.9.2009.12.14.20.12.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 14 Dec 2009 20:12:51 -0800 (PST)
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Dec 2009 12:12:41 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u4yom7zgmn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Patch for bitbake to enable the --ignore-deps option accept regular expression
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
X-List-Received-Date: Tue, 15 Dec 2009 04:14:42 -0000
X-Groupsio-MsgNum: 15064
Content-Type: multipart/mixed; boundary=----------0SKTKzfjC5dqs7O3C21AFO

------------0SKTKzfjC5dqs7O3C21AFO
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
    I modified the bitbake to enable it accept regular expression with -I  
option. Now I can generate dot file without any native packages, using the  
following command:

bitbake -g helloworld-image -I "native$"

    Hope it is useful for you

Thanks a lot!

-- 
Guo Hongruan, Embedded Linux Consultant
Mobile: +86-0-13484056007
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com

------------0SKTKzfjC5dqs7O3C21AFO
Content-Disposition: attachment; filename=ignore-deps-accept-regex.diff
Content-Type: application/octet-stream; name=ignore-deps-accept-regex.diff
Content-Transfer-Encoding: Base64

ZGlmZiAtcnVOIGJpdGJha2UvbGliL2JiL3Rhc2tkYXRhLnB5IGJpdGJha2UtbW9kaWZpZWQvbGli
L2JiL3Rhc2tkYXRhLnB5Ci0tLSBiaXRiYWtlL2xpYi9iYi90YXNrZGF0YS5weQkyMDA5LTExLTA5
IDAzOjIwOjE2LjAwMDAwMDAwMCArMDgwMAorKysgYml0YmFrZS1tb2RpZmllZC9saWIvYmIvdGFz
a2RhdGEucHkJMjAwOS0xMi0xNSAxMToxNToxOC4wMDAwMDAwMDAgKzA4MDAKQEAgLTI2MCwxMCAr
MjYwLDE5IEBACiAgICAgICAgIFJldHVybiBhIGxpc3Qgb2YgYnVpbGQgdGFyZ2V0cyB3aG8ncyBw
cm92aWRlcnMgCiAgICAgICAgIGFyZSB1bmtub3duLgogICAgICAgICAiIiIKKyAgICAgICAgaW1w
b3J0IHJlCisKICAgICAgICAgdW5yZXNvbHZlZCA9IFtdCiAgICAgICAgIGZvciB0YXJnZXQgaW4g
c2VsZi5idWlsZF9uYW1lc19pbmRleDoKLSAgICAgICAgICAgIGlmIHRhcmdldCBpbiBkYXRhQ2Fj
aGUuaWdub3JlZF9kZXBlbmRlbmNpZXM6CisgICAgICAgICAgICBtYXRjaCA9IEZhbHNlCisgICAg
ICAgICAgICBmb3IgaWdwa2cgaW4gZGF0YUNhY2hlLmlnbm9yZWRfZGVwZW5kZW5jaWVzOgorICAg
ICAgICAgICAgICAgIGlmIHRhcmdldCA9PSBpZ3BrZzoKKyAgICAgICAgICAgICAgICAgICAgbWF0
Y2ggPSBUcnVlCisgICAgICAgICAgICAgICAgZWxpZiByZS5zZWFyY2goaWdwa2csdGFyZ2V0KSAh
PSBOb25lOgorICAgICAgICAgICAgICAgICAgICBtYXRjaCA9IFRydWUKKyAgICAgICAgICAgIGlm
IG1hdGNoID09IFRydWU6CiAgICAgICAgICAgICAgICAgY29udGludWUKKwogICAgICAgICAgICAg
aWYgc2VsZi5idWlsZF9uYW1lc19pbmRleC5pbmRleCh0YXJnZXQpIGluIHNlbGYuZmFpbGVkX2Rl
cHM6CiAgICAgICAgICAgICAgICAgY29udGludWUKICAgICAgICAgICAgIGlmIG5vdCBzZWxmLmhh
dmVfYnVpbGRfdGFyZ2V0KHRhcmdldCk6CkBAIC0yNzUsOSArMjg0LDE3IEBACiAgICAgICAgIFJl
dHVybiBhIGxpc3Qgb2YgcnVudGltZSB0YXJnZXRzIHdobydzIHByb3ZpZGVycyAKICAgICAgICAg
YXJlIHVua25vd24uCiAgICAgICAgICIiIgorICAgICAgICBpbXBvcnQgcmUKKwogICAgICAgICB1
bnJlc29sdmVkID0gW10KICAgICAgICAgZm9yIHRhcmdldCBpbiBzZWxmLnJ1bl9uYW1lc19pbmRl
eDoKLSAgICAgICAgICAgIGlmIHRhcmdldCBpbiBkYXRhQ2FjaGUuaWdub3JlZF9kZXBlbmRlbmNp
ZXM6CisgICAgICAgICAgICBtYXRjaCA9IEZhbHNlCisgICAgICAgICAgICBmb3IgaWdwa2cgaW4g
ZGF0YUNhY2hlLmlnbm9yZWRfZGVwZW5kZW5jaWVzOgorICAgICAgICAgICAgICAgIGlmIHRhcmdl
dCA9PSBpZ3BrZzoKKyAgICAgICAgICAgICAgICAgICAgbWF0Y2ggPSBUcnVlCisgICAgICAgICAg
ICAgICAgZWxpZiByZS5zZWFyY2goaWdwa2csdGFyZ2V0KSAhPSBOb25lOgorICAgICAgICAgICAg
ICAgICAgICBtYXRjaCA9IFRydWUKKyAgICAgICAgICAgIGlmIG1hdGNoID09IFRydWU6CiAgICAg
ICAgICAgICAgICAgY29udGludWUKICAgICAgICAgICAgIGlmIHNlbGYucnVuX25hbWVzX2luZGV4
LmluZGV4KHRhcmdldCkgaW4gc2VsZi5mYWlsZWRfcmRlcHM6CiAgICAgICAgICAgICAgICAgY29u
dGludWUKQEAgLTM1Niw5ICszNzMsMTYgQEAKICAgICAgICAgTWFyayBlbnRyaWVzIHdlcmUgc3Bl
Y2lmaWNhbGx5IGFkZGVkIGV4dGVybmFsbHkgYXMgYWdhaW5zdCBkZXBlbmRlbmNpZXMgCiAgICAg
ICAgIGFkZGVkIGludGVybmFsbHkgZHVyaW5nIGRlcGVuZGVuY3kgcmVzb2x1dGlvbgogICAgICAg
ICAiIiIKKyAgICAgICAgaW1wb3J0IHJlCiAKLSAgICAgICAgaWYgaXRlbSBpbiBkYXRhQ2FjaGUu
aWdub3JlZF9kZXBlbmRlbmNpZXM6Ci0gICAgICAgICAgICByZXR1cm4KKyAgICAgICAgbWF0Y2gg
PSBGYWxzZQorICAgICAgICBmb3IgaWdwa2cgaW4gZGF0YUNhY2hlLmlnbm9yZWRfZGVwZW5kZW5j
aWVzOgorICAgICAgICAgICAgaWYgaXRlbSA9PSBpZ3BrZzoKKyAgICAgICAgICAgICAgICBtYXRj
aCA9IFRydWUKKyAgICAgICAgICAgIGVsaWYgcmUuc2VhcmNoKGlncGtnLGl0ZW0pICE9IE5vbmU6
CisgICAgICAgICAgICAgICAgbWF0Y2ggPSBUcnVlCisgICAgICAgIGlmIG1hdGNoID09IFRydWU6
CisgICAgICAgICAgICByZXR1cm4gCiAKICAgICAgICAgaWYgbm90IGl0ZW0gaW4gZGF0YUNhY2hl
LnByb3ZpZGVyczoKICAgICAgICAgICAgIGlmIHNlbGYuZ2V0X3JkZXBlbmRlZXNfc3RyKGl0ZW0p
OgpAQCAtNDA3LDkgKzQzMSwxNiBAQAogICAgICAgICBBZGQgdGhlIHJ1bnRpbWUgcHJvdmlkZXJz
IG9mIGl0ZW0gdG8gdGhlIHRhc2sgZGF0YQogICAgICAgICAodGFrZXMgaXRlbSBuYW1lcyBmcm9t
IFJERVBFTkRTL1BBQ0tBR0VTIG5hbWVzcGFjZSkKICAgICAgICAgIiIiCisgICAgICAgIGltcG9y
dCByZQogCi0gICAgICAgIGlmIGl0ZW0gaW4gZGF0YUNhY2hlLmlnbm9yZWRfZGVwZW5kZW5jaWVz
OgotICAgICAgICAgICAgcmV0dXJuCisgICAgICAgIG1hdGNoID0gRmFsc2UKKyAgICAgICAgZm9y
IGlncGtnIGluIGRhdGFDYWNoZS5pZ25vcmVkX2RlcGVuZGVuY2llczoKKyAgICAgICAgICAgIGlm
IGl0ZW0gPT0gaWdwa2c6CisgICAgICAgICAgICAgICAgbWF0Y2ggPSBUcnVlCisgICAgICAgICAg
ICBlbGlmIHJlLnNlYXJjaChpZ3BrZyxpdGVtKSAhPSBOb25lOgorICAgICAgICAgICAgICAgIG1h
dGNoID0gVHJ1ZQorICAgICAgICBpZiBtYXRjaCA9PSBUcnVlOgorICAgICAgICAgICAgcmV0dXJu
IAogCiAgICAgICAgIGlmIHNlbGYuaGF2ZV9ydW50aW1lX3RhcmdldChpdGVtKToKICAgICAgICAg
ICAgIHJldHVybgo=

------------0SKTKzfjC5dqs7O3C21AFO--
