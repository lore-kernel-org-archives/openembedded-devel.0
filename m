Received: from [62.70.27.18] (helo=esparsett.troll.no)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <lpotter@trolltech.com>) id 1J3FyU-0008G5-6N
	for openembedded-devel@openembedded.org; Fri, 14 Dec 2007 20:13:30 +0100
Received: from esparsett.troll.no (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP
	id 156BE74193; Fri, 14 Dec 2007 20:08:56 +0100 (CET)
Received: from mail.trolltech.com.au (unknown [10.1.1.12])
	by esparsett.troll.no (Postfix) with ESMTP
	id A64C274191; Fri, 14 Dec 2007 20:08:55 +0100 (CET)
Received: from spiritship.local (unknown [172.18.1.2])
	by mail.trolltech.com.au (Postfix) with ESMTP id 0856C3BE627;
	Sat, 15 Dec 2007 05:08:54 +1000 (EST)
From: Lorn Potter <lpotter@trolltech.com>
Organization: Trolltech Pty. Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Dec 2007 05:08:51 +1000
User-Agent: KMail/1.9.6 (enterprise 0.20070907.709405)
References: <fju2o1$9l2$1@ger.gmane.org>
In-Reply-To: <fju2o1$9l2$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200712150508.51430.lpotter@trolltech.com>
Cc: Rolf Leggewie <no2spam@nospam.arcornews.de>,
	openembedded-devel@openembedded.org
Subject: Re: RFC: drop timezones from OE
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
X-List-Received-Date: Fri, 14 Dec 2007 19:13:30 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 15 December 2007, Rolf Leggewie wrote:
> Hi,
>
> it seems that there are two, conflicting packages in OE providing
> timezone data: tzdata from glibc and timezones from opie/handhelds.
>
> I think it would make sense to drop timezones and only have the timezone
> data from glibc as this eliminates problems where one wants to install
> package A that depends on tzdata but you also want package B where the
> dependency is declared for timezones.  Currently, you can only install
> either A or B.
>
> If there is consensus on this, I would take care that OE metadata is
> updated accordingly (drop timezones folder, replace occurences of
> timezones in DEPENDS with tzdata, etc.)


The timezones from opie are at least 4 years old and out of date. You can 
safely discard this package/dependency.



-- 
Lorn 'ljp' Potter
Software Engineer, Systems Group, MES, Trolltech


