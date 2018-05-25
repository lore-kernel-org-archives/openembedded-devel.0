Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4333974CFB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 19:58:26 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id m144-v6so3823654vke.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 12:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PV2GZhPA/R8TeQBR+n4gjW/HfFQ3HMVLG4vj1oyyVbk=;
	b=IO6cR5NExJz9WtZSQUxpZvOjE0MzvFaGK73RemXfaLRIPk9+lHdXRiIT9hVdC/1geM
	Pe4i0phjar6i3wT8/XbbirglZUiJaI+H/kCQQG1cX2RdUsbRhqWfMXCEV59JPcI5MTgF
	xFDWFOcT7spLLpi9dN/vttSRcSUvd/9+BvD2ClHafmA5rTessw24kSiRAbgJn0grJbOn
	dsaBjrawdGHlayZkkhNIts2ytN/EHvQjPAVplTBMSXIGG8Iz87luWXO2Jw3VX1/Kj4bU
	EM5pk9LUPVzpxKVGHTTVrqtgmcWXUXVpGPVRySpqZOaka8NvEDVjJeMypsc9FBbZF8vi
	rpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PV2GZhPA/R8TeQBR+n4gjW/HfFQ3HMVLG4vj1oyyVbk=;
	b=JDfYUXEPOJfBVib7kU0qeYVnMeoamHcgY2g11cDwcqL+JQP1D7255H4rOhtK6eSwIQ
	PXAuyrHBw529kxy1VFa2xvfBpPLWyeHQGXS4IfDVIY8nmNOv4+q+EDJ+fmgOWlERREtO
	O58tTksury5rg1/CWrHXvql3+hO7C3O/BDVl24QPEZT2+vwHuzhpYp8zPkb+gEB/TsDW
	nEVHoUitmE176WdIbFOBqxbI9Kry9Au1wNpiIYtjgKhcPK6PweCBrRk//LU73T+xr3jg
	Hb76GkV6hLi1wNlD/S2s6omxzy2GbPe80tYwiSTMlzVDiVMHsLyWVjFQdZCNasMYNcrr
	DV1A==
X-Gm-Message-State: ALKqPwd/crKg3HrCQt15Fvw5+Y7l3F3WvXhbOqExeNWb7EAqLVaSOVvC
	2k3q3O2AWojOt/IwMWyTUMEcW5YDZtO0ILhPTQc=
X-Google-Smtp-Source: ADUXVKL04VJK/N4YV88XvN4wSss96+6n+hN4arpz+aMpzQNYsfkWDQOKpFeq+L0HEHHWo+UJ+j92tF6d8/FQMO+SZU4=
X-Received: by 2002:a1f:9e17:: with SMTP id
	h23-v6mr2362659vke.24.1527278307882; 
	Fri, 25 May 2018 12:58:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Fri, 25 May 2018 12:58:27
	-0700 (PDT)
In-Reply-To: <CAHUNapRj1Sadwo8BAujAuPn3Egs85vshAgz4dGW8f_4dzd0Atw@mail.gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
	<20180524143854.24096-18-twoerner@gmail.com>
	<CAHUNapRj1Sadwo8BAujAuPn3Egs85vshAgz4dGW8f_4dzd0Atw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 25 May 2018 12:58:27 -0700
Message-ID: <CAJ86T=XbNpLWxCYmOoTRLyvYGZcwD+7tBeg-xi33p1SDZDzEAw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][master-next][PATCH v3 17/17] libeigen: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 25 May 2018 19:58:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 25, 2018 at 8:22 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> As Anuj pointed out with patch 16/17 of this series (opencv: rely on
> cmake.bbclass...), so too is this patch wrong and shouldn't be applied.
> Sorry!
>
> Looking closer at this recipe (on an unrelated issue) do we really want the
> include files being part of FILES_${PN}?

No, we don't. It looks like it's been done that way as a workaround
for the libeigen build not creating anything which would normally go
in the main package. Setting:

  ALLOW_EMPTY_${PN} = "1"

together with careful review of the packaging rules and probably
removing the RDEPENDS and RRECOMMENDS over-rides may be a better
solution.

You should also carefully check that things work as expected when
libeigen is added to an SDK. That's a corner case which tests
dependencies between runtime and -dev packages which isn't tested
during a normal build (for what it's worth, creating an empty runtime
package by using ALLOW_EMPTY_${PN} = "1" has always been the easiest
solution whenever I've looked into this kind of issue in the past and
it "just works" for the SDK case).

