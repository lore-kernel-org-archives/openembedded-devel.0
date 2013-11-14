Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1D12A6D544
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2013 17:57:22 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id wp4so2598028obc.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2013 09:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=l3OaI97vQHsVwqLw8Ghet3NzJ1e+pqWOMBZHq9l3mQg=;
	b=gB6eDuNvOSLFXLnXd69qVBw5BCghWS9DrkktDmq0SpJ17Wv+V3v18MUcWyJjkDsZ2d
	D42HIBvYAMLbh8hfAwvXa8elEFzLsxZ7LLmt4Vnm3k3CbWnKPDcQBvw7CgDi3Yl88q9P
	J8zuIVDWVVpVE0Ro+fkf/KcVo+YR4b1m0InaBcyIMvnet+AE0rG3gVjcYKhq34e3wY2g
	9rdH7LQF32t0PBNg8xtKWWAMNkWJWLuIE8sJGHoXK0mvPoRv+xlDcsNibIpgFg7zo7mf
	lRKtW0Y2VD6lRN0JbeNEjefECSmHjlowEXziCGLiifi/euGYom7IdQJtUNn8wUufogBx
	c/Iw==
MIME-Version: 1.0
X-Received: by 10.60.145.241 with SMTP id sx17mr2679906oeb.57.1384451843524;
	Thu, 14 Nov 2013 09:57:23 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 14 Nov 2013 09:57:23 -0800 (PST)
In-Reply-To: <CAFeBWL4YZ-izwN-3oaqfoaPSi=h=WQ+M0=BU_eGOXtx=q6AfPw@mail.gmail.com>
References: <CAFeBWL4xeq+4cL9gvnCDSU1Va8edf+1zT+G7BfYto7Yvp8HXXQ@mail.gmail.com>
	<CAFeBWL4R46JrAhCfe8GZXTipHAp_i+Fcu_BTTTuopfdfKf9r5g@mail.gmail.com>
	<11078227.Ap2jLt1X9L@helios>
	<CALbNGRSiUdEzPLoP5Le58QDV1cqKcLRRyWxxTGyG4dKu7tqB3Q@mail.gmail.com>
	<CAFeBWL4YZ-izwN-3oaqfoaPSi=h=WQ+M0=BU_eGOXtx=q6AfPw@mail.gmail.com>
Date: Thu, 14 Nov 2013 15:57:23 -0200
X-Google-Sender-Auth: GCC60y2X9cbp7Rac-thKN3bZbvs
Message-ID: <CAP9ODKpMTNOWRkHTv2gWEattq1Bhj-jvbBk80NLt23eV5UzUuw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: libmpd-11.8.17 gets 404 Not Found
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
X-List-Received-Date: Thu, 14 Nov 2013 17:57:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 14, 2013 at 3:16 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> What should be my course of action? Add the new provider to the OE mirror,
> or patch the entire recipe? I can do either, but just not sure what the
> right thing to do. Trying not to pollute. Thanks.

I'd say both. People may be using an old snapshot of OE-Core/Poky and
have the download problem so adding it to the mirror is good. Updating
this is also good so we can check the new path/version/URL for new
versions easily.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

