Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S2ze9-0004dh-8g
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Mar 2012 07:37:49 +0100
Received: by dald2 with SMTP id d2so414946dal.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Feb 2012 22:29:19 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.216.138 as permitted sender) client-ip=10.68.216.138; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.216.138 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.216.138])
	by 10.68.216.138 with SMTP id oq10mr16006295pbc.85.1330583359216
	(num_hops = 1); Wed, 29 Feb 2012 22:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=vbdCIqgkzDjO+lPF5UL8dUWH+o4DLWjVcFwwJVFP6/I=;
	b=durvMJlJA0280kSNFel9rrc7TMUB+5qcPiqzoMGIGfC1PCLnst9JB3y++eEUQFnMBG
	hwLJVAwOAvX/9BX9R0StqdofQnRIbs6S74fQ4Snd6cQsox9NaEmcSFTWAM9vpDzW59rt
	6RSA04rjWElUSTAJ5kgPvF4W0cR6pkEDCc31I=
Received: by 10.68.216.138 with SMTP id oq10mr13281130pbc.85.1330583359119;
	Wed, 29 Feb 2012 22:29:19 -0800 (PST)
Received: from [192.168.1.78] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id d8sm1258959pbg.5.2012.02.29.22.29.17
	(version=SSLv3 cipher=OTHER); Wed, 29 Feb 2012 22:29:18 -0800 (PST)
Message-ID: <4F4F173B.6040706@gmail.com>
Date: Wed, 29 Feb 2012 22:29:15 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120224 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAOHjBZss6YRxsOedgF2v_A__XOgH0m=CZWj-OSGY+si+rOSsFQ@mail.gmail.com>
In-Reply-To: <CAOHjBZss6YRxsOedgF2v_A__XOgH0m=CZWj-OSGY+si+rOSsFQ@mail.gmail.com>
Subject: Re: New task issue on linux-libc-headers
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
X-List-Received-Date: Thu, 01 Mar 2012 06:37:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/29/2012 03:00 AM, Giuseppe Condorelli wrote:
> Hi all,
> 
> I added an own task into my bbclass source (inherited by my conf file). Let
> me to call the new task do_NTASK.
> Into the bbclass I added:
> addtask NTASK after do_compile before do_install
> Then I run the base-image build and I noticed that NTASK is regularly
> called but for linux-libc-headers, which do_install task doesn't execute in
> this situation. If I remove NTASK from the task list the do_install is run
> instead. This is causing a big trouble in my goal but I'm not understanding
> why...
> Please do you have any suggestion?

do_compile for linux-libc-headers is empty
what does your task do ?
are you using oe-core ?

> Cheers,
> Giuseppe
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



