Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QmJWp-0006DU-H2
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 07:53:03 +0200
Received: by fxg11 with SMTP id 11so1016142fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2011 22:48:48 -0700 (PDT)
Received: by 10.205.80.3 with SMTP id zs3mr173455bkb.273.1311832126543;
	Wed, 27 Jul 2011 22:48:46 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id h7sm157883bkd.12.2011.07.27.22.48.44
	(version=SSLv3 cipher=OTHER); Wed, 27 Jul 2011 22:48:45 -0700 (PDT)
Message-ID: <4E30F83B.3080907@dresearch-fe.de>
Date: Thu, 28 Jul 2011 07:48:43 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E301F87.8040609@dresearch-fe.de>
	<CABcZANnYw1Njsi=8BUr0=Mf-O78VEXF9XJQy5-Oqm66+=A7nQQ@mail.gmail.com>
In-Reply-To: <CABcZANnYw1Njsi=8BUr0=Mf-O78VEXF9XJQy5-Oqm66+=A7nQQ@mail.gmail.com>
X-Enigmail-Version: 1.2
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: understanding overlays
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
X-List-Received-Date: Thu, 28 Jul 2011 05:53:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.07.2011 18:12, Chris Larson wrote:
> On Wed, Jul 27, 2011 at 7:24 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>> I'm not really familiar with the oe/bitbake overlay details. So please forgive me if this is a faq. ;-)
>>
>> Is the overlay package or file based?
>>
>> Or in other words is the following scenario possible?
>>
>> base layer:
>>
>>  recipes/
>>    foo/
>>      foo.inc
>>      foo_x.y.z.bb
>>
>> overlay:
>>
>>  recipes/
>>    foo/
>>      foo.inc
>>
>> And than build foo-x.y.z with the foo.inc from the overlay.
> 
> That depends. If the .bb does 'require foo.inc', then no, it will use
> the local one. If it does 'require recipes/foo/foo.inc', then yes, it
> will use the overlay one, assuming the overlay is before the main
> layer in your BBLAYERS.

Thx. What about files referenced e.g. in SRC_URI? I assume that always the ones from the 'highest' layer are used. Right?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


