Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8EEE4728BD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 18:42:25 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id c41so11772489yho.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 10:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=kmjxaKy27NckC3YA6W0M6fUUTHdicPt5mEMWmGI/u+0=;
	b=QCuXdVuwg3Hi7kceaBd4GkJdsVW5+ihFcZuZtbTRbcyri0DewSosvVX9AhcdM4L+gs
	FMoSuJ52gCGUXydn94lMgQBNFSX9874kSVdFH6nnG2ARPEQDfS79wFAsXPl2SwNkzSdi
	kulUrGzNf3gJH03gr+2vCgzYmm8hNo5PqqZHyeXCW2/ST/y/UwxE9JT8BmeVwZUY7slm
	w5NJOFmTKGOxt6qNmDTArUfvpvLV3IRpALsPh3KaBMw7+xV1hvS1AMcA24cPYLlUTIWl
	b35UPlAwAcRy9CClgGbGxAJelDBV7+H9UEh8ZfFJxS0QrMX9z0ESXypx64yOSpZC7M5o
	itJg==
MIME-Version: 1.0
X-Received: by 10.236.30.98 with SMTP id j62mr54120466yha.105.1420569745690;
	Tue, 06 Jan 2015 10:42:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Tue, 6 Jan 2015 10:42:25 -0800 (PST)
In-Reply-To: <20150106182225.GB29986@jama>
References: <BLU436-SMTP224A703B53ECF80B0D6067DC2590@phx.gbl>
	<20150106182225.GB29986@jama>
Date: Tue, 6 Jan 2015 16:42:25 -0200
X-Google-Sender-Auth: 5sgmlsaFrtG8DaFSLmnejnOumQs
Message-ID: <CAP9ODKopG8=q9z9K6es06RFJR4ArP8mJCM4FWaSvyKLO+ZzkBw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: kkelly87 <kaneda18@hotmail.com>
Subject: Re: [meta-qt5][dizzy][PATCH] qttranslations: adding recipe for various qt translation ipks
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
X-List-Received-Date: Tue, 06 Jan 2015 18:42:26 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 6, 2015 at 4:22 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Jan 06, 2015 at 12:29:30PM -0500, kkelly87 wrote:
>> Since the layer does not have a specific recipe for the qttranslation submodule it was never being built
>> and ui elements like the OK and Cancel buttons had no translations.
>
> Can you please create version for master branch as well?
>
> In general new features shouldn't go to release branches, but
> I'm willing to make exception after it's more tested in master
> branch.

Martin means make the patch for master, including 5.4 support. Than it
could be backported to Dizzy.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

