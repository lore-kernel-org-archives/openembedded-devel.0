Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0E10B605B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 16:53:50 +0000 (UTC)
Received: by yhot59 with SMTP id t59so8545028yho.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 08:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=FSueIiJUb5mia/BbIz693ldrgxSt1pDElTLreMv5zzE=;
	b=gcOomBZRKI6ltAqOOopezpUnVtRWR4/wYDhsKEkcoS84V1wbKT3yHcjnIY60R/nvrJ
	elZui/qnElZaNhzKCGWaznkbgttlTW2ZeX2VRls43pC9iYIwk25qFTKCbE/ROBKs8eyR
	HgPTupuZk99lDTx3DgZ1xtXVA28+suPgMMJ+WEq8VRFZBO9IhpOn2HszSLBEYwcsOMyW
	pPDmnzJIFVhQyC0u2/YtBE62HHEBTkBLxFUjO5DUAlyP6rGFDjW3+V04LP9iEw3H6w0d
	pQkXAiXSZm8X6DRT33sGuyevJJ0UmWMrJ3777p0N4HCT1m+vHTGCYJg1vpgGToruccJy
	Qb+Q==
MIME-Version: 1.0
X-Received: by 10.236.44.98 with SMTP id m62mr14437654yhb.136.1425056031868;
	Fri, 27 Feb 2015 08:53:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Fri, 27 Feb 2015 08:53:51 -0800 (PST)
In-Reply-To: <20150227155848.GO2309@jama>
References: <4018372.oWEBFrtGCE@fridolin> <20150227144201.GN2309@jama>
	<1924700.0Y3Fg92bfb@fridolin> <20150227155848.GO2309@jama>
Date: Fri, 27 Feb 2015 13:53:51 -0300
X-Google-Sender-Auth: br3HNAO1VWPSPQlSSYijVL9_zuQ
Message-ID: <CAP9ODKqBVy57VMEe6_aM6-T0VwTXM1MtWrnrxL9uO9HV7S_wVA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] recipes: upgrade from 5.4.0 to 5.4.1
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
X-List-Received-Date: Fri, 27 Feb 2015 16:53:51 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 27, 2015 at 12:58 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Feb 27, 2015 at 04:14:19PM +0100, Stephan Binner wrote:
>> On Friday 27 February 2015 15:42:01 Martin Jansa wrote:
>>
>> > I've fixed these issues in separate commit in meta-qt5/master-next and
>>
>> Thanks.
>>
>> > - please confirm that you agree with SOB line.
>>
>> Sure I do. :-)
>>
>> Today I noticed that qtwebengine doesn't compile if qtbase is not built with
>> "accessibility" (which I usually have defined via some qtbase*.bbappend).
>>
>> The situation was the same with 5.4.0 - not sure if it's worth the effort
>> to patch qtwebengine to be able to compile without accessibility though.
>
> It's the same with qtwebkit, I'll just mention qtwebengine in
> qtbase.inc.
>
> Thanks for letting me know.

I think there is a patch for webengine in dev to allow it to succeed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

