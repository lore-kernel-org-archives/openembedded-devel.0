Received: from [64.233.162.239] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1GrWxk-0005hk-HW
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Dec 2006 10:51:44 +0100
Received: by nz-out-0102.google.com with SMTP id m22so1932108nzf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Dec 2006 01:50:52 -0800 (PST)
Received: by 10.35.89.10 with SMTP id r10mr699082pyl.1165312251899;
	Tue, 05 Dec 2006 01:50:51 -0800 (PST)
Received: by 10.35.119.19 with HTTP; Tue, 5 Dec 2006 01:50:51 -0800 (PST)
Message-ID: <432beae0612050150u64499772m14fefdeb8ccd6e2f@mail.gmail.com>
Date: Tue, 5 Dec 2006 01:50:51 -0800
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d46153c40612041402o2e1ed6fdmdd1a8fa8261d15ce@mail.gmail.com>
MIME-Version: 1.0
References: <d46153c40612041402o2e1ed6fdmdd1a8fa8261d15ce@mail.gmail.com>
Subject: Re: madwifi
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Dec 2006 09:51:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 12/4/06, Andrew Paulsen <andrew.paulsen@gmail.com> wrote:
> Does anyone have any tips for including madwifi into a gpe-image build?
>
> I can "bitbake madwifi-ng" by itself and that appears to work.
>
> If I add
> BOOTSTRAP_EXTRA_RDEPENDS = "madwifi-ng"
> to my machine.conf, or add
>
> GPE_EXTRA_INSTALL += "madwifi-ng"
> to my gpe-image.bb, I get an:
>
> "ERROR: Nothing provides runtime dependency madwifi-ng"
>
> Is there a better way to add packages to an image?
>

The problem you're facing is that you're adding only a runtime
(install-time) dependency and not a compile-time dependency. If you're
compiling in the .dev branch then this is likely a bug (if you're
using BOOTSTRAP_EXTRA_RDEPENDS). If you're using the .oz354x branch
then you need to add madwifi-ng to the DEPENDS of the file you're
editing too.

-- 
Justin Patrin


