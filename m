Received: from [64.233.184.228] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <philipp.zabel@gmail.com>) id 1HYJ58-0002ea-AZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Apr 2007 11:44:10 +0200
Received: by wr-out-0506.google.com with SMTP id 55so1344365wri
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Apr 2007 02:44:09 -0700 (PDT)
Received: by 10.114.185.8 with SMTP id i8mr1774191waf.1175507048108;
	Mon, 02 Apr 2007 02:44:08 -0700 (PDT)
Received: by 10.114.60.9 with HTTP; Mon, 2 Apr 2007 02:44:08 -0700 (PDT)
Message-ID: <74d0deb30704020244g2a269eacx49ef799a06ef6656@mail.gmail.com>
Date: Mon, 2 Apr 2007 11:44:08 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4610C901.2010306@openhardware.net>
MIME-Version: 1.0
References: <4610C901.2010306@openhardware.net>
Subject: Re: patch: shasum vs. sha256sum
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
X-List-Received-Date: Mon, 02 Apr 2007 09:44:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/2/07, Tom Walsh <tom@openhardware.net> wrote:
> Just noticed that the sha256sum has been added to the
> classes/sanity.bbclass and bitbake balked at running.   This morning I
> had installed perl-Digest::SHA to satisfy the need for 'shasum'.
>
> I haven't found any package on Mandriva that provides 'sha256sum',
> however, adding '-a 256' sets the sha256 algorithm for shasum?  With
> these two changes, bitbake seems to build the project ok, or, am I
> missing something here?

sha256sum is a part of coreutils (in debian).
I assumed it to be more common than the perl shasum utility that is
hidden in perl-Digest::SHA.

regards
Philipp


