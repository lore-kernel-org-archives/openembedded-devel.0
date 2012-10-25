Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.mclaurin@gmail.com>) id 1TRWlC-0002ON-8X
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 01:22:46 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so1112321wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2012 16:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=j7gEaTrpVxr0gPojEnHJwKjm8hRta3bUs7peMRxW3yg=;
	b=aJ4AKXPm3EFN0PbGt88koaXzvnTzLA7ZB6R5sTBKE0Kl5wmRSv5epSWVUmIRgMZa0k
	cCNKTEEffHVvL+R09XNYdTsSc6mCl5q9vwNooCOaLeU4TCcl8KdJlyo7dxP/mIZL/b8a
	S9KPfR3y9L6Ejyr53nCZigzhwV/k7DK+NmMK48FDyK4DDp0hgcVwXvL8SzASi+9/sqED
	dEirJzzpTi/Owu3SeC4JYejMshHfZxts/1gd/lCbrHOU0EBfM5nxYQ6TAVdSNuO3BJTr
	V1Pz7JvB2oWfBhLKwiUbeHf06XheZR4qhqqFaA6Z7d3JmAeQ4OIYwMfFcap0mv5ycaMy
	t4Hg==
MIME-Version: 1.0
Received: by 10.216.70.13 with SMTP id o13mr13376633wed.184.1351206556928;
	Thu, 25 Oct 2012 16:09:16 -0700 (PDT)
Received: by 10.216.33.70 with HTTP; Thu, 25 Oct 2012 16:09:16 -0700 (PDT)
Date: Thu, 25 Oct 2012 18:09:16 -0500
Message-ID: <CAKgF1SuHffULsmTJDWh5SpAY_bqrHaEsp1XT+Z8A-i6=N_k=xg@mail.gmail.com>
From: Jason McLaurin <jason.mclaurin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Cross compiler including files from /usr/include
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
X-List-Received-Date: Thu, 25 Oct 2012 23:22:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi folks,

I solved this on my own, and the issue was my fault.  One of my
sub-projects was adding "/usr/include" to the include path, and that's
what was pulling in incompatible headers.  Fixing that fixed the
problem.

Sorry for the noise...

-Jason


