Received: from [64.233.184.226] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JloJm-0002BB-HN
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Apr 2008 18:47:38 +0200
Received: by wr-out-0506.google.com with SMTP id 36so1104158wra.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2008 09:47:36 -0700 (PDT)
Received: by 10.115.59.2 with SMTP id m2mr5233394wak.197.1208278055096;
	Tue, 15 Apr 2008 09:47:35 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Tue, 15 Apr 2008 09:47:35 -0700 (PDT)
Message-ID: <19c1b8a90804150947y484520a2j726123713ff216fa@mail.gmail.com>
Date: Tue, 15 Apr 2008 09:47:35 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080415163930.GA14446@deadlock.dhs.org>
MIME-Version: 1.0
References: <20080415122902.GA13726@deadlock.dhs.org>
	<4804D346.50809@gmail.com> <20080415163930.GA14446@deadlock.dhs.org>
Subject: Re: How to properly enforce an ARM OABI build?
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
X-List-Received-Date: Tue, 15 Apr 2008 16:47:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

you can also try to comment out

ARM_ABI ?= "${@['','oabi'][bb.data.getVar('MACHINE',d) in
['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"

and check

On Tue, Apr 15, 2008 at 9:39 AM, Sergey 'Jin' Bostandzhyan
<jin@mediatomb.cc> wrote:
> On Tue, Apr 15, 2008 at 09:09:42AM -0700, Khem Raj wrote:
>  > > MACHINE="armv4t"
>  > > DISTRO="angstrom-2007.1"
>  > > TARGET_OS :="linux"
>  > > ARM_ABI := "oabi"
>  >
>  > may be use '=' instead of ':='
>
>  I did try that before trying := but there was no difference...
>
>
>
>
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


