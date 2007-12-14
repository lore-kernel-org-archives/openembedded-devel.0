Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <hvontres@gmail.com>) id 1J3CNs-0007GG-JS
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2007 16:23:28 +0100
Received: by wa-out-1112.google.com with SMTP id l24so1973439waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2007 07:18:56 -0800 (PST)
Received: by 10.142.77.11 with SMTP id z11mr1516082wfa.98.1197645536074;
	Fri, 14 Dec 2007 07:18:56 -0800 (PST)
Received: by 10.143.11.12 with HTTP; Fri, 14 Dec 2007 07:18:56 -0800 (PST)
Message-ID: <a7f8874a0712140718l66a33e9aq527038aa4f1a5a15@mail.gmail.com>
Date: Fri, 14 Dec 2007 07:18:56 -0800
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fju2o1$9l2$1@ger.gmane.org>
MIME-Version: 1.0
References: <fju2o1$9l2$1@ger.gmane.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
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
X-List-Received-Date: Fri, 14 Dec 2007 15:23:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Dec 14, 2007 6:08 AM, Rolf Leggewie <no2spam@nospam.arcornews.de> wrote:

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
>
> Regards
>
> Rolf
>
> <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>
+1 from me. I have been using tzdata for almost a year now.


-- 
Henry von Tresckow (hvontres)

