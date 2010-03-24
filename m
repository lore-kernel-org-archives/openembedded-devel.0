Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NuTb8-0000er-OH
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 17:38:27 +0100
Received: by pwj5 with SMTP id 5so451407pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 09:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=K2ZU0Z75evrMcPpP1Fbpr6b4OsCLUH0dc3valoENgDE=;
	b=V/CVNI9hHqXAfR2pcPuwPRUSHfHM398LYRpT4Ihh7Jcz7mCNC9Mp7k92/i9yu1ijGE
	CaXOMchgSSDJBLknIHvqdaHRu3N5Am0iQjZ3y95fhh3Z0w7K61pIBQkk7MqZpOC98zfl
	IAWAKkpuWR9lqgNqZvOQwLt/l8FxwuFjdjzAg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=sLKJQtox2DEL9R08sFGsn5Y+UuY+/2PIr5UP3xyaaCfTEzAzNo59V1oAbw6stN+nw3
	szFEzdVqC+QmBmX2e94nbf0DiuGRPrhZjxpBM4aY3gWD0ZhA3xQhAwZjogKeRj71NyOD
	pC7IyDej2kM/nnV3nBA6s4sV99iRtNzaFZP/M=
Received: by 10.141.53.1 with SMTP id f1mr4744314rvk.142.1269448515804;
	Wed, 24 Mar 2010 09:35:15 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 20sm94645pzk.7.2010.03.24.09.35.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 24 Mar 2010 09:35:14 -0700 (PDT)
Date: Wed, 24 Mar 2010 09:35:28 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100324163528.GA15272@gmail.com>
References: <201003231901.24017.marcin@juszkiewicz.com.pl>
	<20100323183615.GE3249@xora-eee.xora.org.uk>
	<ac9c93b11003240032h636a60detc59ab859e6fa79c8@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b11003240032h636a60detc59ab859e6fa79c8@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Removal of e2fsprogs-libs
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
X-List-Received-Date: Wed, 24 Mar 2010 16:38:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (24/03/10 08:32), Frans Meulenbroeks wrote:
> 2010/3/23 Graeme Gregory <dp@xora.org.uk>:
> > On Tue, Mar 23, 2010 at 07:01:23PM +0100, Marcin Juszkiewicz wrote:
> >>
> >> During last days I spent a bit of time on e2fsprogs* and util-linux-ng
> >> recipes. They are cleaner now but there is still some work to do.
> >>
> >> We have many recipes which depends on 'e2fsprogs-libs' when they want
> >> 'libblkid' or 'libuuid' which are provided by 'e2fsprogs-libs' and
> >> 'util-linux-ng' recipes. I checked how Debian solves that and got into point
> >> where there is no 'e2fsprogs-libs' recipes in my tree and everything is
> >> building.
> >>
> >> What needs to be changed?
> >>
> >> 1. git rm -r recipes/e2fsprogs-libs
> >> 2. check each recipe which depends on 'e2fsprogs-libs' which library it really
> >>    wants
> >> 3. change each recipe which wants 'libblkid' or 'libuuid' to depend on
> >>    'util-linux-ng'
> >> 4. change each recipe which wants 'libcom_err' or 'libss' to depend on
> >>    'e2fsprogs'
> >> 5. add "--with-elf-shlibs" to 'e2fsprogs' to get 'libcom_err' and 'libss'
> >> 6. fix packaging of 'e2fsprogs' to get separate packages for libraries.
> >>
> >> I can work on that in next days but want to inform everyone that such change
> >> will be done.
> >>
> > Hrw thanks for cleaning this up, feel free to add my ack to your completed
> > worked.
> 
> Although I highly welcome the cleanup proposed by Marcin, I feel it is
> not proper to submit an ack for patches that are not submitted as
> such.
> Acked-by indicates approval, and I find it somewhat fishy to approve a
> patch that you haven't seen yet.
> (without wanting to question the value or quality of Marcin's work, as
> that will undoubtly be ok).

RFC is request for comment. He is putting forth an idea and wants to know
if its worth. IMO there is nothing wrong in acking the proposal. When the
real code comes around then it can be reviewed for what it does.

Thx
-Khem
> 
> Frans
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


