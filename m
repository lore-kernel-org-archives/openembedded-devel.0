Return-Path: <dhylands@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1C9AC6FD1B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 May 2014 17:55:35 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 9so557889ykp.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 May 2014 10:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=paz1lEkwDxMR5UajnIJB26DanE1BSHDPJ5wruN0eirg=;
	b=Vpbrd7KEOq27grYzBN1poFo3ho/ld3qR9dfS9H/WSRCzdC50DFogoBK5sKTuMFYjGX
	sJPbqPsTdZwVm1WZRz1Ocw3YQXv9lJclzJ8AFH+ZOtV5zc6tsnKU60A5mCFFY6rAaCDT
	hBItferznMjcGc0cQl6c9dg+9d4rTsbE/NO+NEnoLimGIsbTw4rWPCitb5j0oPiGQCe8
	y1/JquapvMVEAw34855TmW0gPlpY7yBzev2Sxww1FWOrkPRmpLtAbFn4CQ7OkR7lqfTV
	+vpPwnRzMd7L4OJIBqQDwEDTizGh+wRceY1b1LVDUEgc0Ud6Gt7526bk3W/Nl36/jcrl
	7WiA==
MIME-Version: 1.0
X-Received: by 10.236.131.42 with SMTP id l30mr12249748yhi.130.1401386136752; 
	Thu, 29 May 2014 10:55:36 -0700 (PDT)
Received: by 10.170.110.136 with HTTP; Thu, 29 May 2014 10:55:36 -0700 (PDT)
In-Reply-To: <CAMKF1sq1PqmB+vqdN4CHXZfPG8j-iOBBgW2P4uWxWMA0LS38=w@mail.gmail.com>
References: <CABi1daHuRYWXAy629iwuUJfUwsQxDWaS3B8zdUO+sks4_fL8BQ@mail.gmail.com>
	<3076920.GIcPHFYYDY@peggleto-mobl5.ger.corp.intel.com>
	<CAMKF1sq1PqmB+vqdN4CHXZfPG8j-iOBBgW2P4uWxWMA0LS38=w@mail.gmail.com>
Date: Thu, 29 May 2014 10:55:36 -0700
Message-ID: <CABi1daFxSsAr3UwEz7i-EjKnT3Q7vwP3Wx=GUEJYiXeTp=89HA@mail.gmail.com>
From: Dave Hylands <dhylands@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Issue with x264_git.bb
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
X-List-Received-Date: Thu, 29 May 2014 17:55:43 -0000
X-Groupsio-MsgNum: 50108
Content-Type: multipart/mixed; boundary=20cf301b622bdfeaee04fa8da29b

--20cf301b622bdfeaee04fa8da29b
Content-Type: text/plain; charset=UTF-8

Here's a patch for the dylan branch of git@github.com:
openembedded/meta-openembedded.git

There is a file: http://sprunge.us/dGOU which provides mappings from the
old hashes to new hashes for any other hashes which might be required.


On Thu, May 29, 2014 at 10:50 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, May 29, 2014 at 10:01 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > We just noticed this yesterday too. The story with the recipe is that
> after
> > dylan it got moved to the OE-Core repository, but it's just as broken
> there so
> > we'll need to fix it in dylan in meta-oe and in master of OE-Core, and
> from
> > there we can get it backported to daisy/dora branches of OE-Core as
> well. If
> > you could send a patch that would be great.
>
>
> http://lists.openembedded.org/pipermail/openembedded-core/2014-May/093010.html
>



-- 
Dave Hylands
Shuswap, BC, Canada
http://www.davehylands.com

--20cf301b622bdfeaee04fa8da29b
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-Update-the-hash-used-for-x264_git.bb.patch"
Content-Disposition: attachment; 
	filename="0001-Update-the-hash-used-for-x264_git.bb.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hvsd3vre0

RnJvbSBmZWUwMzI4M2YyY2ExOTM2NjRiZWNlMDlkMDI2YmNiNzZmMjE2YTI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYXZlIEh5bGFuZHMgPGRoeWxhbmRzQGdtYWlsLmNvbT4KRGF0
ZTogVGh1LCAyOSBNYXkgMjAxNCAxMDo1MDoyOCAtMDcwMApTdWJqZWN0OiBbUEFUQ0hdIFVwZGF0
ZSB0aGUgaGFzaCB1c2VkIGZvciB4MjY0X2dpdC5iYgoKVGhpcyBmaWxlOiBodHRwOi8vc3BydW5n
ZS51cy9kR09VIGhhcyB0aGUgbWFwcGluZ3MgZnJvbSB0aGUgb2xkIGhhc2ggdG8gdGhlIG5ldyBo
YXNoCmFuZCB0aGUgdHJlZSBzaG91bGQgaGF2ZSBzdGFiaWxpemVkIChvciBzbyBJIHdhcyB0b2xk
IG9uIElSQykuCi0tLQogbWV0YS1vZS9yZWNpcGVzLW11bHRpbWVkaWEveDI2NC94MjY0X2dpdC5i
YiB8ICAgIDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1tdWx0aW1lZGlhL3gyNjQveDI2NF9naXQu
YmIgYi9tZXRhLW9lL3JlY2lwZXMtbXVsdGltZWRpYS94MjY0L3gyNjRfZ2l0LmJiCmluZGV4IGM3
NjdmZmQuLjRkYTI0Y2MgMTAwNjQ0Ci0tLSBhL21ldGEtb2UvcmVjaXBlcy1tdWx0aW1lZGlhL3gy
NjQveDI2NF9naXQuYmIKKysrIGIvbWV0YS1vZS9yZWNpcGVzLW11bHRpbWVkaWEveDI2NC94MjY0
X2dpdC5iYgpAQCAtMTEsNyArMTEsNyBAQCBERVBFTkRTID0gInlhc20tbmF0aXZlIgogU1JDX1VS
SSA9ICJnaXQ6Ly9naXQudmlkZW9sYW4ub3JnL3gyNjQuZ2l0IFwKICAgICBmaWxlOi8vZG9uLXQt
ZGVmYXVsdC10by1jb3J0ZXgtYTktd2l0aC1uZW9uLnBhdGNoIFwKICIKLVNSQ1JFViA9ICIxY2Zm
ZTlmNDA2Y2M1NGY0NzU5ZmM5ZWViODU1OThmYjhjYWU2NmM3IgorU1JDUkVWID0gImJmZWQ3MDhj
NTM1OGEyYjRlZjY1OTIzZmIwNjgzY2VmYTkxODRlNmYiCiAKIFBWID0gInIyMjMwK2dpdCIKIAot
LSAKMS43LjkuNQoK

--20cf301b622bdfeaee04fa8da29b--
