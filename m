Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OMMnk-0003b3-SM
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 17:02:48 +0200
Received: by iwn6 with SMTP id 6so3945288iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 07:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=ndNFu56o/jsvqzkbTPX6qnfuzWt17ME3Fm3EMKAvulo=;
	b=dkp712oGyr2CsBkssPhF6yCtAac+1/EBIy4teAs+LppQidO2HRxO2KWz/a4ps3mQJE
	vhgkJErJhjIEHFoYc+7uLnqq5Zt3dQd82hBs76uzcCvGC4CcqNUq1GQOvOoDPMMBqDR1
	VKkqS0F/yPHB2g8kzbdKYC+qa+MPTACnJUotI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=OrBJz2z6PagaWYaGnJ4L3gopqGA+8M544bcJZmUJ7OhDOvmF/zxTneAw+Mwt+YPxm0
	CxpAzWUAlxIDNgrLgHxXbQhmvWn+yqB7rjU/SrhL//Jy1iKN/cE21Ll2TUm6OHwDn5sX
	yAPdWOr6xcVKL1Igv7TBad+7XgD+1srCKoxwc=
Received: by 10.229.219.129 with SMTP id hu1mr7003481qcb.111.1276095502479; 
	Wed, 09 Jun 2010 07:58:22 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.3.133 with HTTP; Wed, 9 Jun 2010 07:57:56 -0700 (PDT)
In-Reply-To: <AANLkTikJJyDSd62eVkxlmfpjI7MgxhElzou8Kec2zcqQ@mail.gmail.com>
References: <4C0F9119.3000909@freyther.de>
	<AANLkTikJJyDSd62eVkxlmfpjI7MgxhElzou8Kec2zcqQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 9 Jun 2010 07:57:56 -0700
X-Google-Sender-Auth: IILFGqk0TlytLjln2IpPGB1OR_E
Message-ID: <AANLkTinL7xDvSoHdsxgkSumCFQNg8r3YC30gJUBcA-jO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: TSC Meetings for the meeting of June
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
X-List-Received-Date: Wed, 09 Jun 2010 15:02:51 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 9, 2010 at 6:53 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/6/9 Holger Freyther <holger+oe@freyther.de <holger%2Boe@freyther.de>
> >:
> > We were carrying the org.openembedd.dev branch name from the monotone
> > era into the git era and the TSC was asked to consider renaming it to
> > 'master' which is the git default for the main development tree. Now the
> > actual change on the server will be minor what is of a bigger concern
> > are the existing users and documentation.
>
> Technically speaking I think we should have run an RFC for this before
> it was brought to the table of the TSC.
>
> Personally the org.openembedded.dev branch name does not bother me
> although I know master is the 'standard' git name.
> Afaik renaming does not really solve a problem.
>

Personally, I have to type it at least a few times a day, it gets old, and I
think its time we ditched monotone remnants where we're able to do so.

I am not too sure how much this affects the current users. Actually I
> doubt if the change is bigger than the packages -> recipes renaming
> Isse is that if we do that we should make sure all relevant
> documentation is updated, otherwise we only create confusion (which
> might still creep up as people use old mailing list articles).
>
> Considering this, I am in favour of keeping things as they are.


If we implement this, I don't really see a problem doing it for the users:


>  >  c.) To ease this for existing users and to reduce the amount of
> >      support org.openembedded.dev will track master and remains
> >      available for a limited but long amount of time.
>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

