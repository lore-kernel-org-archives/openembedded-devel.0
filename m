Received: from [209.85.134.188] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J5frW-0001Wp-Ml
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2007 12:16:18 +0100
Received: by mu-out-0910.google.com with SMTP id w9so255939mue.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2007 03:11:06 -0800 (PST)
Received: by 10.86.62.3 with SMTP id k3mr1028462fga.73.1198235466553;
	Fri, 21 Dec 2007 03:11:06 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id 12sm1245021fks.12.2007.12.21.03.11.05
	(version=SSLv3 cipher=OTHER); Fri, 21 Dec 2007 03:11:05 -0800 (PST)
Date: Fri, 21 Dec 2007 13:16:21 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <6010564518.20071221131621@gmail.com>
To: Robert Schuster <theBohemian@gmx.net>
In-Reply-To: <476B9470.2020607@gmx.net>
References: <476B7A8D.4070603@gmx.net>
	<1198230789.4636.25.camel@localhost.localdomain>
	<476B9470.2020607@gmx.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: feature request - wrap sources
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
X-List-Received-Date: Fri, 21 Dec 2007 11:16:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Robert,

Friday, December 21, 2007, 12:24:48 PM, you wrote:

> Richard Purdie schrieb:
>> On Fri, 2007-12-21 at 09:34 +0100, Robert Schuster wrote:
>>> I have a feature request that should help dealing with those source
>>> tarballs which do not contain a proper top level directory. The idea is
>>> to allow to add a parameter 'wrap' to the SRC_URI entry denoting the
>>> source tarball. If it is present (and 1) the unpacker creates a
>>> directory named ${P} and unpacks the tarball therein.
>>>
>>> This would make it unneccessary to change S for such packages and
>>> furthermore the work directory is not cluttered with files and folders
>>> from inside the source tarball.
>>>
>>> Like it? (Any pointer where such code should be put?)
>> 
>> Would it not be simpler just to specify an attribute like unpacksubdir
>> which you could set to ${PN}-${PV}?
> Specifying the directory to be created would be nice. However one of my
> idea was that by using such a mechanism S would be correct.

> Would it be possible to automatically set S to ${WORKDIR}/<anything> if
> unpacksubdir=<anything> is used? If so we could have genericity and
> saving boilerplate code. :)

  Why, instead, S has default value of "${WORKDIR}/${P}", so just fit
unpacksubdir up to that. And that unpacksubdir is yet stuff to implement
AFAIU.

> Regards
> Robert




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



