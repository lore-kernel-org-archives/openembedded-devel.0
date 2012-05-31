Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sa6EH-00006w-6M
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 16:19:57 +0200
Received: by eekd49 with SMTP id d49so386578eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 07:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=JEUkzmSL5Ls2ZhYOrFF2IOf5fMApGKKjn+oYmSZ3Vp4=;
	b=fO9NzpHcUmZA9vxUqjWb5xVMWkiKJYdO6CFUJSK/cVGNAGXvVvzVblkjIhlYnhvceC
	kMPp95a38vYKayrDtdq0dcvnTaTMmQ72sfwQ2mfUtnrJy4yxArDfGV7jTGXEquolix+z
	jLvu2C9AuHOFybHYk8zt72hVz7OsAA38mmhFvVEUh4rsocOXNzSoVFzXDP7DcA/doYqm
	IdcEdSJg+7eX6Zk9Tem/vrMkQtSG4LroSx9/Svx09x4Ub7oDc5hS/jqTD8DnMcMa5iSH
	G/5DayhOxdnxNvHssz/+Pfnh04DYIwJRyzDzwGdphnwDe8Hx2RJPEGuyYBykrrZJ7igT
	nqBA==
Received: by 10.14.188.140 with SMTP id a12mr7389861een.25.1338473377495; Thu,
	31 May 2012 07:09:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Thu, 31 May 2012 07:09:07 -0700 (PDT)
In-Reply-To: <1338461940-3040-4-git-send-email-schnitzeltony@googlemail.com>
References: <1338461940-3040-1-git-send-email-schnitzeltony@googlemail.com>
	<1338461940-3040-4-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 May 2012 07:09:07 -0700
Message-ID: <CAMKF1sr1admX+B7vr=DsMVO2mhnOxaJ7+h-+1xpmQMD6_NtgRg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 3/4] systemd.bbclass: extract SYSTEMD_SERVICE properly
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
X-List-Received-Date: Thu, 31 May 2012 14:19:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

T24gVGh1LCBNYXkgMzEsIDIwMTIgYXQgMzo1OCBBTSwgQW5kcmVhcyBNw7xsbGVyCjxzY2huaXR6
ZWx0b255QGdvb2dsZW1haWwuY29tPiB3cm90ZToKPiArZGVmIGdldF9wYWNrYWdlX3ZhcihkLCB2
YXIsIHBrZyk6Cj4gKyDCoCDCoCDCoCB2YWwgPSBkLmdldFZhcignJXNfJXMnICUgKHZhciwgcGtn
KSwgZCwgMSkKPiArIMKgIMKgIMKgIGlmIHZhbDoKPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHZh
bCA9IHZhbC5zdHJpcCgpCj4gKyDCoCDCoCDCoCBlbHNlOgo+ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgdmFsID0gIiIKPiArIMKgIMKgIMKgIGlmIHZhbCA9PSAiIjoKPiArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHZhbCA9IGJiLmRhdGEuZ2V0VmFyKHZhciwgZCwgMSkKPiArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGlmIHZhbDoKPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHZhbCA9
IHZhbC5zdHJpcCgpCj4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbHNlOgo+ICsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdmFsID0gIiIKPiArIMKgIMKgIMKgIHJldHVybiB2YWwK
PiArCgpnZXRWYXIgaXMgdXNlZCBpbmNvbnNpc3RlbnRseS4gc2Vjb25kbHkgY2FuIGl0IGJlIHJl
c3RydWN0dXJlZCBhIGJpdApzZWVtcyB0b28gbWFueSBpZnMgYW5kIGVsc2VzCg==


