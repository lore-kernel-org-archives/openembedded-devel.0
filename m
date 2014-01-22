Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC7A6B389
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:29:13 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id va2so474745obc.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=IMSS6Sx+CR7E1rPWVfkNSBYoZJa6DTeB665LL88tzeU=;
	b=lSBYkADmGCpuftbRSL65BVDtYBBXOAHVTT00m3SbA65+lPzaw9vlb2zXYXqvFSORFl
	GQNpU/n6efl8XXIzhKcWg0+6RMcAFdiao0czqmASSmZQJNUydvj5YecmOwSlD+WwHqHB
	D2+CYqLfmNMUjtJhErWoR5ZqRre+N6TR8f+x5r+eNzgfFbubmKStVxObdnEezKxiteIc
	/LGQJ1JgV9xXdjpL9qWNs8yiMU8G7RwjhLv/n+wfjyuPe0RQo9A7Bcd6cSLDza7N8b1T
	8IuDSo31DdidgBQzPVi17xkQr4+NEM5SWzJ2qwyPHnmz9VQjeTmKPgvq3otQK/EihxLd
	R3Sg==
MIME-Version: 1.0
X-Received: by 10.182.241.8 with SMTP id we8mr1499845obc.62.1390400954628;
	Wed, 22 Jan 2014 06:29:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:29:14 -0800 (PST)
In-Reply-To: <52DDE074.7070000@windriver.com>
References: <1389940848-376-1-git-send-email-jackie.huang@windriver.com>
	<1500081.lxhvWhSdf3@peggleto-mobl5.ger.corp.intel.com>
	<52DDE074.7070000@windriver.com>
Date: Wed, 22 Jan 2014 12:29:14 -0200
X-Google-Sender-Auth: 7D9BHiIRom_ko_airXV_Rjixa5U
Message-ID: <CAP9ODKpZ+f1=kg3Qo8FO0axKMr+i6VhT2mXnOhciJErK3vPCtA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [meta-networking][PATCH] strongswan: update verion to 5.1.1
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
X-List-Received-Date: Wed, 22 Jan 2014 14:29:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 21, 2014 at 12:50 AM, jhuang0 <jackie.huang@windriver.com> wrote:
>
>
> On 1/20/2014 10:56 PM, Paul Eggleton wrote:
>>
>> On Friday 17 January 2014 14:40:48 jackie.huang@windriver.com wrote:
>>>
>>> * Add rdepends on strongswan-plugins.
>>
>>
>> Is this really correct? Does strongswan not work without the plugins?
>
>
> Yes, without the plugins, the ipsec_starter fails to start:
>
> root@qemu0:~# ipsec start
> Starting strongSwan 5.1.1 IPsec [starter]...
> root@qemu0:~# tail /var/log/auth.log -n 4
> 2014-01-21T02:46:57.175940+00:00 qemu0 ipsec_starter[926]: Starting
> strongSwan 5.1.1 IPsec [starter]...
> 2014-01-21T02:46:57.653396+00:00 qemu0 ipsec_starter[935]: charon has quit:
> initialization failed
> 2014-01-21T02:46:57.656916+00:00 qemu0 ipsec_starter[935]: charon refused to
> be started
> 2014-01-21T02:46:57.661374+00:00 qemu0 ipsec_starter[935]: ipsec starter
> stopped

So why to split it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

