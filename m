Received: from [209.85.128.187] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philipp.zabel@gmail.com>) id 1JZN70-0003jL-E8
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 10:19:04 +0100
Received: by fk-out-0910.google.com with SMTP id 18so3231700fks.12
	for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 02:17:00 -0700 (PDT)
Received: by 10.82.161.19 with SMTP id j19mr4329102bue.12.1205313419409;
	Wed, 12 Mar 2008 02:16:59 -0700 (PDT)
Received: by 10.82.118.18 with HTTP; Wed, 12 Mar 2008 02:16:59 -0700 (PDT)
Message-ID: <74d0deb30803120216y65be1b2cmaaaa9b2acf98ecee@mail.gmail.com>
Date: Wed, 12 Mar 2008 10:16:59 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47D71B8F.1030108@balister.org>
MIME-Version: 1.0
References: <47D71B8F.1030108@balister.org>
X-SA-Exim-Connect-IP: 209.85.128.187
X-SA-Exim-Mail-From: philipp.zabel@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: Git versus Hg
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
X-List-Received-Date: Wed, 12 Mar 2008 09:19:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Mar 12, 2008 at 12:53 AM, Philip Balister <philip@balister.org> wrote:
> Given the only serious contenders for possible SCM's for OE appear to be
>  git or Hg, I am curious about the expertise level available on this list.
>
>  Basically, let us know if you use git or Hg on a regular basis in a two
>  way workflow and consider yourself knowledgeable on sorting out problems
>  that crop up.

I have Hg installed since the last round of SCM discussion but never
used it seriously.
My git experience is mainly restricted to porcelain (add commit rebase
cherry-pick, etc.).
I'm using it for kernel work and for a handful of local repositiories
with linear history.

As I'm working under what one could today call serious resource
constraints (laptop w/ one 60GB hdd), git clone --reference and inline
branches are important features to me. And besides catching up with
mainline linux, git-rebase -i gives me the ability to check in every
stupid thought and easily clean up once I'm satisfied, whereas with
monotone I currently have to experiment outside of version control.

What is still unclear to me is how well a shared git repository with
push access for multiple parties is going to work. The mobile-linux
repository on serenity had some kind of permission trouble before we
added the group permission fixup in the post-update hook.

regards
Philipp


