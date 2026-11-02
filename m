Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2431.1793655474721623147
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 13:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=j9ddtLXJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso5049616e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 13:37:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793655472; cv=none;
        d=google.com; s=arc-20260327;
        b=NpqFkaPAr6o8xoHn6YvBGxLxRrcQHfWpGHl7412ONyPWYrZiycoN481WebtRJ+t9Em
         cvZNjJiVMf4A3pi9JdbJkPdjqNyJ7RHreHf2Ia2NqUE3WG6ctBhMBa+/Rst5hq3pKvH5
         2rJb5n1Bo/S9qcKp2ldcd/ytn8P+YuM38Sexasp87hFVt5Pe16XpgrTke98IdPRJyyRi
         rOJdmdfym40gkH4SaNm1kE2smTw4wy49PJl1JT+Ez6CJ0MiDgWdNG+S73FgyHqwrzXmz
         NJBx7iXR4SI73oPpgF6DRVuxv9wh+WgzjuDl4QTtqK7mLZnGN9H2BcJl010zOhrQSYYV
         6pGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=emfhzYMsKEsMsvOO+g8ivolDF9PDSdga8rI7DhBbIXg=;
        fh=KrToilEgaUxzlTlMq/D00IpOqgpSi0CqLzbTmKahTD0=;
        b=krvyIzsA8IFfakugTRnspdv0u8cypTcarbTd7JoSu2NeGj/FT25EhjRiJcTNHzmg1T
         AfnXbVg/VLbi16GOM5LKZZpKfSNni1+XJ4FXYBhk8Da893Bm2NPAxx/a+6aHgwfpMCwD
         Q5L3qwBpfhDgAAwSaDBiJaGenKABoZs6lr9Ys0MpCUug7dY+XnjgBp3jJys/od1hutax
         FLvCY0Qx1sB2wNDQ3SRP7VBl5p12ra2AcrkinKNDN41kAWn2YPhXem01fWmcE+sR5U6E
         +IBqk1uifaL3+08n+ofYRU/GgGgaSZg7nY5kRyNNzYe/dLsJjEKUK0lX56n5FrRirJL2
         kR3A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793655472; x=1794260272; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=emfhzYMsKEsMsvOO+g8ivolDF9PDSdga8rI7DhBbIXg=;
        b=j9ddtLXJ3iFEY3jeNZa+nbyee7D1OgYss8e/68wtPWBy+kRTFLnuf1VQR80lXXXPbc
         J1x2fR5Zh0Hw2luJhJHkkQ2kE0qSEmqwlzUfEfMQu0RqkXF0Czu2zll5x+/6u7QSaS0o
         trcAZ841lA5A1W8elXC0PoslHOc9JrhOHA2ss7hQ142acYwh0Pwg4b3YitpLjSqZQdt5
         6SvcW0FMuHqDrxHvaQodENNHW/WMApeZsLL5naLl7OasDTibQJZVUQf+Pzi7iAYYhVfk
         pYaLchK1uOmECtEsBL/p2g2g6AmpmHbIIp2aUw5v+GCdiAIE+ZRrIqK6qqvNoo/OzKjS
         fGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793655472; x=1794260272;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=emfhzYMsKEsMsvOO+g8ivolDF9PDSdga8rI7DhBbIXg=;
        b=xWQ9qkIYkPDc39MRI/xuPhbsnKtoQ+3q+RTDMzegjGRKAVQRCC5U4pwY0liDmLZRQp
         izN38jpU57ana0PE0p3JkJedPQ6pK/bUHzzS29Ev4h9NFCqEPf7A2cWLLuAHXSkFl+pc
         p6Vyb1WTwMfm+kxc9DnsgikxZ1pqyn7aNJ31wE6gqVR/jKk12ETt0qxZtAMuAemilNKC
         Mk4hrju3dF27HV7W610UEt+6R7Fz5ZokQ//rzTPOx23FhYSBLl1fKH+uJC9AcPEr5Kks
         tXmFZDjkroDQ1EJZCiQId4tXxs/uZFAFSOPMSPC/oxpLVcrpnqYRiuKZHcCz6KGXCZDS
         132A==
X-Gm-Message-State: APuU4Z/v+lMhSsGAh/fd9mTLVuipysgFPfK7dxsiGBILzNvZkpZimyox
	P0HbnX5tIUw9Y0lLucyIejqOL3DxJrKhFvfO5sws2CHp2au1FLhqhfMVbpS/WIhAtLsyWiZIUPB
	bXzh9h0rZcXAXfG8jdl2XQz6eNm/x4lU=
X-Gm-Gg: AYBFou3mmUU+1JiIkNTU44aoUvzy2DM5LRBQgC1KwufJDGQvdfMrTDqjK0RwrEfmpvE
	Hzvz7Y9Bg0ZV5wPsnCk8Fdwml/sPh/RzGSFFGew9H4sWgoupOmE7UQ8Yw/ruz1CrKkaGWWUG1s1
	gpd+t3cTooV1dnREp23OkW6oE90y/wRQYJJDyDd8PJLkYr57vH/E69I+r3C9vFwVnv+6wJjF2Es
	wFMHWeCZ0Wg6KdNahtdIzKfwJj98sOyNBMDkOEk8hRBIOdgguXfFae9dnoSCDSTIOwPn5EROGj3
	OUVl5m5KdalKHRTpIyOGNWkIMSTIn3bL6Ne9r4Emb8DVLBIN7mWdts58sE9vFuOAwZ7REfcZ+OH
	ktJQF1miKr+pxMtzMSBjtLhWdv0hC2wGyOZ9NMuTgO1K5V0Hu2fyAJRfeXBXXwHjOiim4MCg=
X-Received: by 2002:ac2:4c52:0:b0:5bc:e472:12fb with SMTP id
 2adb3069b0e04-5bfd957d05dmr3395564e87.63.1793655471781; Mon, 02 Nov 2026
 13:37:51 -0800 (PST)
MIME-Version: 1.0
References: <20261102211142.319090-1-kris.gavvala@windriver.com>
In-Reply-To: <20261102211142.319090-1-kris.gavvala@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 2 Nov 2026 13:37:36 -0800
X-Gm-Features: AclHuK8AH78ALhpKdnYrqqzlhLrwazcybciIwarnDlQnjFEl47J76xYCqedQsf4
Message-ID: <CANx9H-CZOy=w20RLOooL8=AJdd6_cZ2RpHCai-GwXGWRkzu47Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pillow: patch CVE-2026-112393
To: Kris.Gavvala@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003eb864065f51f5ea"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 21:38:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131754

--0000000000003eb864065f51f5ea
Content-Type: text/plain; charset="UTF-8"

There is a pillow 13.0.0 release and I would rather see an upgrade than
patches. If this is for a stable release branch, please include the branch
in the subject line, e.g. [wrynose].

On Mon, Nov 2, 2026 at 13:12 Gavvala, Kris via openembedded-devel
<Kris.Gavvala=windriver.com@lists.openembedded.org> wrote:

> This patch applies the upstream fix and related tests in commit [1]
> to address the issue in [2].
>
> [1]
> https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08037f77465a61d90633f669013f4
> [2]
> https://github.com/python-pillow/Pillow/security/advisories/GHSA-332p-7hrc-92wf
>
> Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
> ---
>  .../python3-pillow/CVE-2026-112393.patch      | 124 ++++++++++++++++++
>  .../python/python3-pillow_12.3.0.bb           |   1 +
>  2 files changed, 125 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
> b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
> new file mode 100644
> index 0000000000..cb9be3b33e
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
> @@ -0,0 +1,124 @@
> +From 9b693ea929423da2bebef5523881ae3850c3877e Mon Sep 17 00:00:00 2001
> +From: Jeffrey 'Alex' Clark <aclark@aclark.net>
> +Date: Mon, 12 Oct 2026 21:18:41 -0400
> +Subject: [PATCH] Fix heap buffer overflow in _tiffWriteProc when saving
> TIFF
> + to BytesIO
> +
> +libtiff seeks past the current end of data when writing the directory
> +and writes tag values there. _tiffWriteProc sized its realloc() from
> +state->size + size instead of the write position state->loc + size,
> +so the first out-of-line tag value written after such a seek could
> +overrun the allocation by up to the size of the directory. The bytes
> +skipped by the seek were also never zeroed, leaking stale heap
> +contents into the saved file.
> +
> +Size the buffer from the write position and zero the space added by
> +realloc, matching the semantics of writing to a real file. Reject
> +writes where the position is still beyond the buffer for the
> +non-reallocating case.
> +
> +Reported-by: carlini
> +Reported-by: Tomer-PL
> +Fixes: GHSA-332p-7hrc-92wf
> +
> +Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
> +Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> +
> +CVE: CVE-2026-112393
> +Upstream-Status: Backport [
> https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08037f77465a61d90633f669013f4
> ]
> +
> +Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
> +---
> + Tests/test_file_libtiff.py  | 36 ++++++++++++++++++++++++++++++++++++
> + src/libImaging/TiffDecode.c | 15 ++++++++++++++-
> + 2 files changed, 50 insertions(+), 1 deletion(-)
> +
> +diff --git a/Tests/test_file_libtiff.py b/Tests/test_file_libtiff.py
> +index c9849a056..84e4299a1 100644
> +--- a/Tests/test_file_libtiff.py
> ++++ b/Tests/test_file_libtiff.py
> +@@ -757,6 +757,42 @@ class TestFileLibTiff(LibTiffTestCase):
> +         save_bytesio("packbits")
> +         save_bytesio("tiff_lzw")
> +
> ++
> ++    def test_save_bytesio_seek_past_end(self, tmp_path: Path) -> None:
> ++        # When writing the directory, libtiff seeks past the end of the
> data
> ++        # written so far, and then writes the tag values there. Check
> that the
> ++        # in-memory write buffer grows to fit, and that the bytes that
> are
> ++        # skipped over are zero, as they would be when writing to a file.
> ++
> ++        # 7 distinct bytes per row: PackBits emits 8 bytes per row, so
> the strip
> ++        # plus the header are exactly 64 KiB, the initial size of the
> buffer
> ++        im = Image.new("L", (7, 8191))
> ++        im.putdata([(i * 37) & 0xFF for i in range(7 * 8191)])
> ++        kwargs: dict[str, Any] = {
> ++            "compression": "packbits",
> ++            "description": "D" * 65535,
> ++        }
> ++
> ++        outfile = tmp_path / "temp.tif"
> ++        im.save(outfile, **kwargs)
> ++        buffer_io = io.BytesIO()
> ++        im.save(buffer_io, format="tiff", **kwargs)
> ++        assert buffer_io.getvalue() == outfile.read_bytes()
> ++
> ++        # odd-length tag values, so that libtiff pads between them.
> Large enough
> ++        # that the buffer has to be reallocated
> ++        im = hopper().resize((300, 300))
> ++        kwargs = {
> ++            "compression": "tiff_lzw",
> ++            "description": "abcdef",
> ++            "software": "xyz0",
> ++            "tiffinfo": {315: "artist", 33432: "copyright!"},
> ++        }
> ++        im.save(outfile, **kwargs)
> ++        buffer_io = io.BytesIO()
> ++        im.save(buffer_io, format="tiff", **kwargs)
> ++        assert buffer_io.getvalue() == outfile.read_bytes()
> ++
> +     def test_save_ycbcr(self, tmp_path: Path) -> None:
> +         im = hopper("YCbCr")
> +         outfile = tmp_path / "temp.tif"
> +diff --git a/src/libImaging/TiffDecode.c b/src/libImaging/TiffDecode.c
> +index 72e0d7b30..e21327f02 100644
> +--- a/src/libImaging/TiffDecode.c
> ++++ b/src/libImaging/TiffDecode.c
> +@@ -88,10 +88,12 @@ _tiffWriteProc(thandle_t hdata, tdata_t buf, tsize_t
> size) {
> +     dump_state(state);
> +
> +     to_write = min(size, state->size - (tsize_t)state->loc);
> ++    // libtiff may have seeked past the end of the buffer, e.g. when
> writing the
> ++    // directory, so the required size is based on the current location.
> +     if (state->flrealloc && size > to_write) {
> +         tdata_t new_data;
> +         tsize_t newsize = state->size;
> +-        while (newsize < (size + state->size)) {
> ++        while (newsize < (size + (tsize_t)state->loc)) {
> +             if (newsize > INT_MAX - 64 * 1024) {
> +                 return 0;
> +             }
> +@@ -105,9 +107,20 @@ _tiffWriteProc(thandle_t hdata, tdata_t buf, tsize_t
> size) {
> +             // fail out
> +             return 0;
> +         }
> ++        // zero the new space, so that any bytes libtiff seeks over
> without
> ++        // writing are 0 in the output, as they would be in a file
> ++        memset((UINT8 *)new_data + state->size, 0, newsize -
> state->size);
> +         state->data = new_data;
> +         state->size = newsize;
> +         to_write = size;
> ++    } else if (to_write < 0) {
> ++        TIFFError(
> ++            "_tiffWriteProc",
> ++            "Invalid Write at loc %" PRIu64 ", size: %" PRIu64,
> ++            state->loc,
> ++            (toff_t)state->size
> ++        );
> ++        return 0;
> +     }
> +
> +     TRACE(("to_write: %d\n", (int)to_write));
> +--
> +2.43.0
> +
> diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb
> b/meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb
> index 1c6668e53d..e4826da1a6 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=a6f0ac3777cfc96ded1b825e32ae7c99"
>
>  SRC_URI = "git://
> github.com/python-pillow/Pillow.git;branch=main;protocol=https;tag=${PV}
> <http://github.com/python-pillow/Pillow.git;branch=main;protocol=https;tag=$%7BPV%7D>
> \
>             file://0001-support-cross-compiling.patch \
> +           file://CVE-2026-112393.patch \
>             "
>  SRCREV = "bb1d8e8ab8d29048624d96e3ee53cecf7c13d13d"
>
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131753):
> https://lists.openembedded.org/g/openembedded-devel/message/131753
> Mute This Topic: https://lists.openembedded.org/mt/122066176/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000003eb864065f51f5ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">There is a pillow 13.0.0 release and I would rather see a=
n upgrade than patches. If this is for a stable release branch, please incl=
ude the branch in the subject line, e.g. [wrynose].</div><div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, Nov 2, 2026 at 13:12 Gavvala, Kris via openembedded-devel &lt;Kr=
is.Gavvala=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windri=
ver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">This patch applies the upstream fix and relat=
ed tests in commit [1]<br>
to address the issue in [2].<br>
<br>
[1] <a href=3D"https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08=
037f77465a61d90633f669013f4" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/python-pillow/Pillow/commit/78c08bd4d9c08037f77465a61d90633f66901=
3f4</a><br>
[2] <a href=3D"https://github.com/python-pillow/Pillow/security/advisories/=
GHSA-332p-7hrc-92wf" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/python-pillow/Pillow/security/advisories/GHSA-332p-7hrc-92wf</a><br>
<br>
Signed-off-by: Kris Gavvala &lt;<a href=3D"mailto:kris.gavvala@windriver.co=
m" target=3D"_blank">kris.gavvala@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../python3-pillow/CVE-2026-112393.patch=C2=A0 =C2=A0 =C2=A0 | 124 ++=
++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-pillow_12.3.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-pillow_12.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 125 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-112393.patch<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-11=
2393.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-11=
2393.patch<br>
new file mode 100644<br>
index 0000000000..cb9be3b33e<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.pa=
tch<br>
@@ -0,0 +1,124 @@<br>
+From 9b693ea929423da2bebef5523881ae3850c3877e Mon Sep 17 00:00:00 2001<br>
+From: Jeffrey &#39;Alex&#39; Clark &lt;<a href=3D"mailto:aclark@aclark.net=
" target=3D"_blank">aclark@aclark.net</a>&gt;<br>
+Date: Mon, 12 Oct 2026 21:18:41 -0400<br>
+Subject: [PATCH] Fix heap buffer overflow in _tiffWriteProc when saving TI=
FF<br>
+ to BytesIO<br>
+<br>
+libtiff seeks past the current end of data when writing the directory<br>
+and writes tag values there. _tiffWriteProc sized its realloc() from<br>
+state-&gt;size + size instead of the write position state-&gt;loc + size,<=
br>
+so the first out-of-line tag value written after such a seek could<br>
+overrun the allocation by up to the size of the directory. The bytes<br>
+skipped by the seek were also never zeroed, leaking stale heap<br>
+contents into the saved file.<br>
+<br>
+Size the buffer from the write position and zero the space added by<br>
+realloc, matching the semantics of writing to a real file. Reject<br>
+writes where the position is still beyond the buffer for the<br>
+non-reallocating case.<br>
+<br>
+Reported-by: carlini<br>
+Reported-by: Tomer-PL<br>
+Fixes: GHSA-332p-7hrc-92wf<br>
+<br>
+Co-authored-by: Copilot &lt;<a href=3D"mailto:223556219%2BCopilot@users.no=
reply.github.com" target=3D"_blank">223556219+Copilot@users.noreply.github.=
com</a>&gt;<br>
+Co-Authored-By: Claude Opus 5.5 &lt;<a href=3D"mailto:noreply@anthropic.co=
m" target=3D"_blank">noreply@anthropic.com</a>&gt;<br>
+<br>
+CVE: CVE-2026-112393<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/python-pillow/Pil=
low/commit/78c08bd4d9c08037f77465a61d90633f669013f4" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08=
037f77465a61d90633f669013f4</a>]<br>
+<br>
+Signed-off-by: Kris Gavvala &lt;<a href=3D"mailto:kris.gavvala@windriver.c=
om" target=3D"_blank">kris.gavvala@windriver.com</a>&gt;<br>
+---<br>
+ Tests/test_file_libtiff.py=C2=A0 | 36 +++++++++++++++++++++++++++++++++++=
+<br>
+ src/libImaging/TiffDecode.c | 15 ++++++++++++++-<br>
+ 2 files changed, 50 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/Tests/test_file_libtiff.py b/Tests/test_file_libtiff.py<br>
+index c9849a056..84e4299a1 100644<br>
+--- a/Tests/test_file_libtiff.py<br>
++++ b/Tests/test_file_libtiff.py<br>
+@@ -757,6 +757,42 @@ class TestFileLibTiff(LibTiffTestCase):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0save_bytesio(&quot;packbits&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0save_bytesio(&quot;tiff_lzw&quot;)<br>
+ <br>
++<br>
++=C2=A0 =C2=A0 def test_save_bytesio_seek_past_end(self, tmp_path: Path) -=
&gt; None:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # When writing the directory, libtiff seeks p=
ast the end of the data<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # written so far, and then writes the tag val=
ues there. Check that the<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # in-memory write buffer grows to fit, and th=
at the bytes that are<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # skipped over are zero, as they would be whe=
n writing to a file.<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # 7 distinct bytes per row: PackBits emits 8 =
bytes per row, so the strip<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # plus the header are exactly 64 KiB, the ini=
tial size of the buffer<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 im =3D Image.new(&quot;L&quot;, (7, 8191))<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 im.putdata([(i * 37) &amp; 0xFF for i in rang=
e(7 * 8191)])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 kwargs: dict[str, Any] =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;compression&quot;: &quot;=
packbits&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;description&quot;: &quot;=
D&quot; * 65535,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 outfile =3D tmp_path / &quot;temp.tif&quot;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 im.save(outfile, **kwargs)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer_io =3D io.BytesIO()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 im.save(buffer_io, format=3D&quot;tiff&quot;,=
 **kwargs)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert buffer_io.getvalue() =3D=3D outfile.re=
ad_bytes()<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # odd-length tag values, so that libtiff pads=
 between them. Large enough<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # that the buffer has to be reallocated<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 im =3D hopper().resize((300, 300))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 kwargs =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;compression&quot;: &quot;=
tiff_lzw&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;description&quot;: &quot;=
abcdef&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;software&quot;: &quot;xyz=
0&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tiffinfo&quot;: {315: &qu=
ot;artist&quot;, 33432: &quot;copyright!&quot;},<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 im.save(outfile, **kwargs)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer_io =3D io.BytesIO()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 im.save(buffer_io, format=3D&quot;tiff&quot;,=
 **kwargs)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert buffer_io.getvalue() =3D=3D outfile.re=
ad_bytes()<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0def test_save_ycbcr(self, tmp_path: Path) -&gt; None:<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0im =3D hopper(&quot;YCbCr&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0outfile =3D tmp_path / &quot;temp.tif&qu=
ot;<br>
+diff --git a/src/libImaging/TiffDecode.c b/src/libImaging/TiffDecode.c<br>
+index 72e0d7b30..e21327f02 100644<br>
+--- a/src/libImaging/TiffDecode.c<br>
++++ b/src/libImaging/TiffDecode.c<br>
+@@ -88,10 +88,12 @@ _tiffWriteProc(thandle_t hdata, tdata_t buf, tsize_t s=
ize) {<br>
+=C2=A0 =C2=A0 =C2=A0dump_state(state);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0to_write =3D min(size, state-&gt;size - (tsize_t)state=
-&gt;loc);<br>
++=C2=A0 =C2=A0 // libtiff may have seeked past the end of the buffer, e.g.=
 when writing the<br>
++=C2=A0 =C2=A0 // directory, so the required size is based on the current =
location.<br>
+=C2=A0 =C2=A0 =C2=A0if (state-&gt;flrealloc &amp;&amp; size &gt; to_write)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tdata_t new_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tsize_t newsize =3D state-&gt;size;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (newsize &lt; (size + state-&gt;size)) =
{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (newsize &lt; (size + (tsize_t)state-&g=
t;loc)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (newsize &gt; INT_MAX -=
 64 * 1024) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -105,9 +107,20 @@ _tiffWriteProc(thandle_t hdata, tdata_t buf, tsize_t =
size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// fail out<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // zero the new space, so that any bytes libt=
iff seeks over without<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // writing are 0 in the output, as they would=
 be in a file<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset((UINT8 *)new_data + state-&gt;size, 0,=
 newsize - state-&gt;size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;data =3D new_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;size =3D newsize;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to_write =3D size;<br>
++=C2=A0 =C2=A0 } else if (to_write &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 TIFFError(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;_tiffWriteProc&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Invalid Write at loc %&qu=
ot; PRIu64 &quot;, size: %&quot; PRIu64,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;loc,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (toff_t)state-&gt;size<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0TRACE((&quot;to_write: %d\n&quot;, (int)to_write));<br=
>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pillow_12.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pillow_12.3.=
0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pi=
llow_12.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pillow_12.3.0.=
bb</a><br>
index 1c6668e53d..e4826da1a6 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pillow_=
12.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pillow_12.3.0.bb</a=
><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pillow_=
12.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pillow_12.3.0.bb</a=
><br>
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da6f0ac3777c=
fc96ded1b825e32ae7c99&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/python-pillow/Pi=
llow.git;branch=3Dmain;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer"=
 target=3D"_blank">github.com/python-pillow/Pillow.git;branch=3Dmain;protoc=
ol=3Dhttps;tag=3D${PV}</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-support-cross-compili=
ng.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-112393.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRCREV =3D &quot;bb1d8e8ab8d29048624d96e3ee53cecf7c13d13d&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131753): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131753" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131753</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122066176/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/122066176/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003eb864065f51f5ea--
