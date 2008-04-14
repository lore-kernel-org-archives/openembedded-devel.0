Received: from [213.207.90.162] (helo=daffy.sipo.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lists@t3i.nl>) id 1JlNYU-0008WP-6A
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Apr 2008 14:13:02 +0200
Received: from nobody by daffy.sipo.nl with local (Exim 4.63)
	(envelope-from <lists@t3i.nl>) id 1JlNYS-0008Eh-TD
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Apr 2008 14:13:01 +0200
To: openembedded-devel@lists.openembedded.org
From: "RvP" <lists@t3i.nl>
Mime-Version: 1.0
X-Mailer: Mr.Mail 0.6alpha
X-Originating-IP: 83.83.2.224
X-MsgID: php48034a4cb8f9a
Message-Id: <E1JlNYS-0008Eh-TD@daffy.sipo.nl>
Date: Mon, 14 Apr 2008 14:13:00 +0200
Subject: Re: task configuration not evaluated?
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
X-List-Received-Date: Mon, 14 Apr 2008 12:13:02 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit


Thanks, that fixed the problem!

----- Oorspronkelijk bericht -----
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: 14-Apr-2008 12:15
Subject: Re: [oe] task configuration not evaluated?

> Dnia Monday 14 of April 2008, RvP napisa³:
> 
> > I modified the packages/tasks/task-slugos.bb file after building the
> > SlugOS image and did a bb slugos-image'. A new image was built, but the
> > changes I put in the task-slugos.bb were not taken into account. More
> > specifically: I removed the via-velocity kernel module from the
> > SLUGOS_STANDARD_RRECOMMENDS and added another (fs) module. 
> 
> > What should I do to make changes in the task file effective (except for
> > rebuiling everyting...)?
> 
> If recipe change affect build then PR value needs to be bumped.
> 
> -- 
> JID: hrw-jabber.org
> OpenEmbedded developer/consultant
> 
>   Think for yourselves and let others enjoy the privilege to do so, too.
>   -- Voltaire
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 


