Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msundius@sundius.com>) id 1Pwf8R-0002xo-QI
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 19:26:24 +0100
Received: by qyk27 with SMTP id 27so4108202qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Mar 2011 10:24:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.127.104 with SMTP id f40mr2845412qcs.272.1299522289855;
	Mon, 07 Mar 2011 10:24:49 -0800 (PST)
Received: by 10.229.27.82 with HTTP; Mon, 7 Mar 2011 10:24:49 -0800 (PST)
In-Reply-To: <AANLkTikzk175mvsX+JCC7Mfm_gt=xdxG67NR4v5WF8x9@mail.gmail.com>
References: <AANLkTikzk175mvsX+JCC7Mfm_gt=xdxG67NR4v5WF8x9@mail.gmail.com>
Date: Mon, 7 Mar 2011 10:24:49 -0800
Message-ID: <AANLkTimq_RPygsu8yOv_JZ1_Bjs20OZeQWb_v7YTTDNy@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org, bitbake-dev@lists.berlios.de
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: How does oe handle rebuilds?
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
X-List-Received-Date: Mon, 07 Mar 2011 18:26:24 -0000
X-Groupsio-MsgNum: 29966
Content-Type: multipart/mixed; boundary=000e0cdf9b4076ec60049de89c13

--000e0cdf9b4076ec60049de89c13
Content-Type: text/plain; charset=ISO-8859-1

I think there are different policies that you can use to decide re building
dependent
packages...

I added a patch to our bitbake that creates a "black-list" of packages that
should be checked for decencies that have out of date time stamps.

this is different to what exists in bitbake since it currently uses a "white
list"
which becomes a list of packages that don't need to be checked. I found
that you'd have to select a lot of packages for that to be useful. most of
the
time people are developing on a finite number of packages which you might
need to rebuild.

attached is a diff to the bitbake that we're currently using (its version is
1.11 or something)
I hope its useful (I'd love for it to be put into bitbake, alas it slipped
through the cracks
last time I pointed it out to the list).

I'm adding bitbake-dev on this list since *I think* this is a bitbake thing.

mike





On Mon, Mar 7, 2011 at 9:58 AM, Charles Manning <cdhmanning@gmail.com>wrote:

> I find I often have problems when using oe that changing a recipe does
> not result in dependent packages being rebuilt. A bit of Googling
> suggests that many experience this issue and take manual steps to
> force rebuilding.
>
> For example, changing the kernel requires rebuilding various libraries
> (tslib etc) and rebuilding the image.
>
> 1.Should oe be able to handle that automatically or is this oe's
> "killer defect" (ie. opposite of "killer feature").
> 2. Is there something missing in recipes to show the correct dependencies?
> 3. What is the best way to manage these stale dependencies?
>
> Thanks
>
> Charles
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

--000e0cdf9b4076ec60049de89c13
Content-Type: text/x-patch; charset=US-ASCII; name="bitbake-blacklist.diff"
Content-Disposition: attachment; filename="bitbake-blacklist.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gkzpyibw0

ZGlmZiAtLWdpdCBhL2xpYi9iYi9ydW5xdWV1ZS5weSBiL2xpYi9iYi9ydW5xdWV1ZS5weQppbmRl
eCA3MzQ4ODQ2Li5iMTMxNTcyIDEwMDY0NAotLS0gYS9saWIvYmIvcnVucXVldWUucHkKKysrIGIv
bGliL2JiL3J1bnF1ZXVlLnB5CkBAIC0xNzQsNiArMTc0LDcgQEAgY2xhc3MgUnVuUXVldWU6CiAg
ICAgICAgIHNlbGYuc2NoZWR1bGVyID0gYmIuZGF0YS5nZXRWYXIoIkJCX1NDSEVEVUxFUiIsIGNm
Z0RhdGEsIDEpIG9yICJzcGVlZCIKICAgICAgICAgc2VsZi5zdGFtcHBvbGljeSA9IGJiLmRhdGEu
Z2V0VmFyKCJCQl9TVEFNUF9QT0xJQ1kiLCBjZmdEYXRhLCAxKSBvciAicGVyZmlsZSIKICAgICAg
ICAgc2VsZi5zdGFtcHdoaXRlbGlzdCA9IGJiLmRhdGEuZ2V0VmFyKCJCQl9TVEFNUF9XSElURUxJ
U1QiLCBjZmdEYXRhLCAxKSBvciAiIgorICAgICAgICBzZWxmLnN0YW1wYmxhY2tsaXN0ID0gYmIu
ZGF0YS5nZXRWYXIoIkJCX1NUQU1QX0JMQUNLTElTVCIsIGNmZ0RhdGEsIDEpIG9yICIiCiAKICAg
ICBkZWYgcmVzZXRfcnVucXVldWUoc2VsZik6CiAgICAgICAgIHNlbGYucnVucV9mbmlkID0gW10K
QEAgLTY4OCw2ICs2ODksMTcgQEAgY2xhc3MgUnVuUXVldWU6CiAgICAgICAgICAgICBzdGFtcGZu
d2hpdGVsaXN0LmFwcGVuZChmbikKICAgICAgICAgc2VsZi5zdGFtcGZud2hpdGVsaXN0ID0gc3Rh
bXBmbndoaXRlbGlzdAogCisgICAgICAgICMgQ3JlYXRlIGEgYmxhY2tsaXN0IHVzYWJsZSBieSB0
aGUgc3RhbXAgY2hlY2tzCisgICAgICAgIHN0YW1wZm5ibGFja2xpc3QgPSBbXQorICAgICAgICBm
b3IgZW50cnkgaW4gc2VsZi5zdGFtcGJsYWNrbGlzdC5zcGxpdCgpOgorICAgICAgICAgICAgZW50
cnlpZCA9IHNlbGYudGFza0RhdGEuZ2V0YnVpbGRfaWQoZW50cnkpCisgICAgICAgICAgICBpZiBl
bnRyeWlkIG5vdCBpbiBzZWxmLnRhc2tEYXRhLmJ1aWxkX3RhcmdldHM6CisgICAgICAgICAgICAg
ICAgY29udGludWUKKyAgICAgICAgICAgIGZuaWQgPSBzZWxmLnRhc2tEYXRhLmJ1aWxkX3Rhcmdl
dHNbZW50cnlpZF1bMF0KKyAgICAgICAgICAgIGZuID0gc2VsZi50YXNrRGF0YS5mbl9pbmRleFtm
bmlkXQorICAgICAgICAgICAgc3RhbXBmbmJsYWNrbGlzdC5hcHBlbmQoZm4pCisgICAgICAgIHNl
bGYuc3RhbXBmbmJsYWNrbGlzdCA9IHN0YW1wZm5ibGFja2xpc3QKKwogICAgICAgICAjc2VsZi5k
dW1wX2RhdGEodGFza0RhdGEpCiAKICAgICAgICAgc2VsZi5zdGF0ZSA9IHJ1blF1ZXVlUnVuSW5p
dApAQCAtNzk2LDYgKzgwOCw5IEBAIGNsYXNzIFJ1blF1ZXVlOgogICAgICAgICAgICAgaWYgc2Vs
Zi5zdGFtcHBvbGljeSA9PSAid2hpdGVsaXN0IjoKICAgICAgICAgICAgICAgICBzdGFtcHdoaXRl
bGlzdCA9IHNlbGYuc3RhbXBmbndoaXRlbGlzdAogCisgICAgICAgIHN0YW1wYmxhY2tsaXN0ID0g
W10KKyAgICAgICAgc3RhbXBibGFja2xpc3QgPSBzZWxmLnN0YW1wZm5ibGFja2xpc3QKKwogICAg
ICAgICBmbiA9IHNlbGYudGFza0RhdGEuZm5faW5kZXhbc2VsZi5ydW5xX2ZuaWRbdGFza11dCiAg
ICAgICAgIGlmIHRhc2tuYW1lIGlzIE5vbmU6CiAgICAgICAgICAgICB0YXNrbmFtZSA9IHNlbGYu
cnVucV90YXNrW3Rhc2tdCkBAIC04MTcsNyArODMyLDcgQEAgY2xhc3MgUnVuUXVldWU6CiAgICAg
ICAgICAgICAgICAgZm4yID0gc2VsZi50YXNrRGF0YS5mbl9pbmRleFtzZWxmLnJ1bnFfZm5pZFtk
ZXBdXQogICAgICAgICAgICAgICAgIHRhc2tuYW1lMiA9IHNlbGYucnVucV90YXNrW2RlcF0KICAg
ICAgICAgICAgICAgICBzdGFtcGZpbGUyID0gIiVzLiVzIiAlIChzZWxmLmRhdGFDYWNoZS5zdGFt
cFtmbjJdLCB0YXNrbmFtZTIpCi0gICAgICAgICAgICAgICAgaWYgZm4gPT0gZm4yIG9yIChmdWxs
ZGVwdHJlZSBhbmQgZm4yIG5vdCBpbiBzdGFtcHdoaXRlbGlzdCk6CisgICAgICAgICAgICAgICAg
aWYgZm4gPT0gZm4yIG9yIChmdWxsZGVwdHJlZSBhbmQgZm4yIG5vdCBpbiBzdGFtcHdoaXRlbGlz
dCkgb3IgZm4yIGluIHN0YW1wYmxhY2tsaXN0OgogICAgICAgICAgICAgICAgICAgICB0cnk6CiAg
ICAgICAgICAgICAgICAgICAgICAgICB0MiA9IG9zLnN0YXQoc3RhbXBmaWxlMilbc3RhdC5TVF9N
VElNRV0KICAgICAgICAgICAgICAgICAgICAgICAgIGlmIHQxIDwgdDI6Cg==

--000e0cdf9b4076ec60049de89c13--
