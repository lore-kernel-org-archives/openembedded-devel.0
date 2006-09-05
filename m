Received: from [64.233.162.203] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GKciw-0003gd-Fd
	for openembedded-devel@openembedded.org; Tue, 05 Sep 2006 17:20:26 +0200
Received: by nz-out-0102.google.com with SMTP id v1so1128858nzb
	for <openembedded-devel@openembedded.org>;
	Tue, 05 Sep 2006 08:17:38 -0700 (PDT)
Received: by 10.35.49.1 with SMTP id b1mr12670100pyk;
	Tue, 05 Sep 2006 08:17:38 -0700 (PDT)
Received: from CUBE ( [82.193.96.237])
	by mx.gmail.com with ESMTP id 36sm4379502nzk.2006.09.05.08.17.35;
	Tue, 05 Sep 2006 08:17:38 -0700 (PDT)
Date: Tue, 5 Sep 2006 18:17:40 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1123249492.20060905181740@gmail.com>
To: Nicola Ranaldo <ranaldo@unina.it>
In-Reply-To: <200609051435.42809.ranaldo@unina.it>
References: <200609051435.42809.ranaldo@unina.it>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: local.conf and DISTRO
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Sep 2006 15:20:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Nicola,

Tuesday, September 5, 2006, 3:35:42 PM, you wrote:

> Sorry if this is a repeated question, i googled and searched the wiki site and
> i did not found a good answer.
> I want to setup an OE environment to develop familiar/opie applications and to
> build missing packages from the installation image.
> The problem is that after a lot of manual patch (ld and libstdc++), BBMASK
> and ASSUME_PROVIDED, i finally have packages, but they depends on newer libs.
> So i have to update them on the device, mixing stable packages with unstable
> packages. When i tryied to compile the hello world application i found i
> needed a threaded qte, missing from the 0.8.4, so i mixed them too.
> I was not able to compile the last kernel, as it seems not patched for h2200.
> It's easy to make the system highly unstable.
> So i'd like to edit my local.conf to build an opie-image from sources used for
> 0.8.4 release and not from cvs.

  What CVS? Anyway, Familiar 0.8.4 was built from a separate tree (see
Familiar's home page), and you'd better use that tree if you just want
to build few packages. Otherwise, there's effort to port Fam0.8.4
changes back to OE's familiar-unstable DISTRO, see recent archives of
this list. You're welcome to help.


> May you help me?

>         Niko

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



