Received: from [64.233.178.247] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <papercrane@gmail.com>) id 1Jro6q-0006YL-By
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 May 2008 07:47:04 +0200
Received: by hs-out-0708.google.com with SMTP id 23so1266569hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 May 2008 22:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:reply-to:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=B+Hs5PZtbb2v8EcDnl6M62cTccUfzXz1FRoJ6ZXbLeI=;
	b=UsSZjRDAeqoxGkxuHmUs7pZ1skM/PJvxp4VqhQtMtJHT2UVTowPzltd2Wc5hI6bAsIXElpZmQkbQUy/YIBCXFpa97KL6jSS+U7JuU7VcrkJHNZKIBKkcTa88+BDSjJdtKdfJ5W3O3a9K5Ta2OrMtZvEuhOM1YUQGWv4RwR3pq6Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=lc703RQ6ZNufPMWWhk9D6u3RgfKi/6XeTLy2k3GFqa5Pfry0y5C30GcXLsW8tlv8cs+jL6S3c6qIueXiacRLF5baK+LvmbvDTmpDhz4jjCvhuKe0tOQZ/dB0MWMU/eHB93OeMOM9wpR47nBmpuZDvNTGYTXXw2hB74iN9qMQl1M=
Received: by 10.90.86.10 with SMTP id j10mr4121379agb.104.1209707186569;
	Thu, 01 May 2008 22:46:26 -0700 (PDT)
Received: by 10.90.95.14 with HTTP; Thu, 1 May 2008 22:46:26 -0700 (PDT)
Message-ID: <432beae0805012246u5de21481vf98787f54c7a0480@mail.gmail.com>
Date: Thu, 1 May 2008 22:46:26 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080313002145.17479f07@widy.localdomain>
MIME-Version: 1.0
References: <1138.1205359393@dls.net>
	<20080313002145.17479f07@widy.localdomain>
Subject: Re: Reconsidering the work flow and how the SCM system fits in
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 02 May 2008 05:47:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Mar 12, 2008 at 3:21 PM, Paul Sokolovsky <pmiscml@gmail.com> wrote:
> Hello,
>
>
>  On Wed, 12 Mar 2008 17:03:13 -0500
>  Mike Westerhof <mwester@dls.net> wrote:
>
>  >  On Wed 12/03/08  4:40 PM , Paul Sokolovsky pmiscml@gmail.com sent:
>  > ...
>  > > With mtn we seem to have very cheap and robust mirroring and
>  > > high-availability. Well, any DSCM lean on possibility of easy
>  > > mirroring, but Monotone with its super-cool concept of unbelievably
>  > > cheap branches (so-called heads), ...
>  >
>  > Hehe! Yes, and I could describe an automobile spinning out-of-control
>  > on a patch of ice as "unbelievably cheap steering" just as well.
>  > Let's not overlook the fact that the multiple-heads issue with
>  > monotone is very seldom because the person doing it *wished* for that
>  > to happen.
>
>  Vice-versa, as was noted already, we have separate head created
>  almost on each commit (i.e. mtn merge almost always has something to
>  do on each run after commit). So, can one imagine more lightweight
>  branches - they are being created even without any explicit command!
>  Poor git is left far behind with its heavy branch commands! ;-D
>

And just to add insult to injury, this also points out that mtn also
merges very well, with no extra help. The non-content conflicts which
are trotted out again and again are due more to incorrect use of mtn
(read: not reading documentation) than to any problems in mtn itself.
It really depends on what you want. Reliable, correct, and impeccable
revision history or history through interchange of patches with an
implicit web of trust.

-- 
Justin Patrin


