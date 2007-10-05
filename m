Received: from [209.85.146.177] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1Idnlw-0007Am-KT
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2007 16:03:21 +0200
Received: by wa-out-1112.google.com with SMTP id l24so675518waf
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2007 06:57:44 -0700 (PDT)
Received: by 10.114.58.1 with SMTP id g1mr4121732waa.1191592664277;
	Fri, 05 Oct 2007 06:57:44 -0700 (PDT)
Received: by 10.114.191.17 with HTTP; Fri, 5 Oct 2007 06:57:44 -0700 (PDT)
Message-ID: <f96d234e0710050657lbbf7391tb2437588f9c93d31@mail.gmail.com>
Date: Fri, 5 Oct 2007 09:57:44 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4705D99D.6070209@miromico.ch>
MIME-Version: 1.0
References: <1191494488.2516.34.camel@toontown> <4704CC05.40206@klever.net>
	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>
	<1191502502.2516.39.camel@toontown>
	<EB5E2840-5F10-45F9-8B97-9FCFDC7F5AAE@selfish.org>
	<D61182AC8012EA4EBC531B3AF23BE10947F630@tranzeo-mail2.12stewart.tranzeo.com>
	<4704F01B.70104@klever.net> <4705D99D.6070209@miromico.ch>
Subject: Re: oe for two target boards at the same time
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
X-List-Received-Date: Fri, 05 Oct 2007 14:03:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/5/07, Alex <mailinglist@miromico.ch> wrote:
> Hi all
>
> How do I setup my directory structure to use oe for two target boards.
>
> I have an AVR32 board and an AT91 board and would like to use oe for
> both of them with at less dublicated software as possible.

As these are different architectures, I don't think you can use
multimachine.  What I typically do is just set up a system where I
share a common overlay (bbcollections), the openembedded directory,
and downloads directory.  The nslu2 master makefile what I started
with, but there are other ways.  Soft links are used to link the
common directories.  EG:

  openembedded
  openembedded.custom (bb collections overlay)
  bitbake
  downloads
  projectA
       openembedded.custom -> ../openembedded.custom
       openembedded -> ../openembedded
       bitbake -> ../bitbake
       downloads -> ../downloads
       tmp
       conf
  projectB
       openembedded.custom -> ../openembedded.custom
       openembedded -> ../openembedded
       bitbake -> ../bitbake
       downloads -> ../downloads
       tmp
       conf

I'd be interested in hearing how others set up their build directory.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


