Return-Path: <coldnew.tw@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0905E6FC70
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 11:55:28 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id c41so691173yho.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 04:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=PFsOo7xQlZjVoZxZGXKZsy1CQnNPe7hwPSvGaHnDBXo=;
	b=Oq/IID2nFQA5T5nLeevAOzXHfPIR6ICmMNL2B+dra0DzukRALtUM2MhXcnHquCDSuV
	ek+UkOpJ8gsGaqa6yTzTQ5OBm6sDzqtwX8KcJ1yY8Rm1c/2ptC5BZbRUOxmRwbeR51S/
	5NcPVx9AREz83fXn5XFWE6HgrTxFo0wj6fWhyZ0+E4wtKZUNC3Ti2qj8iaKVRnKxQw9B
	mANYb882abq4YjqKckHFbC8XLe/Io1IBuvGEhN3E9UlaBLwrsUTvEBc/74zmZtTkFHbx
	cDTeIgPUhelgMAqy+94kdf/4MFk0pME9nyrTCFy42Jm9PY4lC7Hlk6NtJB5hR0mO/amJ
	Nyjg==
MIME-Version: 1.0
X-Received: by 10.236.209.228 with SMTP id s64mr1073869yho.132.1406116528967; 
	Wed, 23 Jul 2014 04:55:28 -0700 (PDT)
Received: by 10.170.100.69 with HTTP; Wed, 23 Jul 2014 04:55:28 -0700 (PDT)
In-Reply-To: <20140723092011.GB22875@jama>
References: <1406105533-78428-1-git-send-email-coldnew.tw@gmail.com>
	<20140723092011.GB22875@jama>
Date: Wed, 23 Jul 2014 19:55:28 +0800
Message-ID: <CAF6djU9xC-2uES3T8oUB6LyJ-6cH=kRVRvzXXAWt7TS5whAjFA@mail.gmail.com>
From: =?UTF-8?B?5b2l55G+?= <coldnew.tw@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] cinematicexperience: fix qt5.3 compatibility
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jul 2014 11:55:36 -0000
Content-Type: text/plain; charset=UTF-8

2014-07-23 17:20 GMT+08:00 Martin Jansa <martin.jansa@gmail.com>:

> On Wed, Jul 23, 2014 at 04:52:13PM +0800, coldnew wrote:
> > cinematicexperience will run failed on Qt5.3 and Qt5.3.1, error message
> > as below
> >
> > ------------------------------------------------------------
> > Qt5_CinematicExperience.qml:26:5: Type MainView unavailable
> >          MainView {
> >          ^
> > /content/MainView.qml:241:9: Type SettingsView unavailable
> >              SettingsView {
> >              ^
> > /content/SettingsView.qml:88:13: Type Switch unavailable
> >                  Switch {
> >                  ^
> > /content/Switch.qml:9:21: Cannot assign a value to a signal (expecting a
> script to be run)
> >          property string onText: "On"
> >
> >                          ^
> >
> > ------------------------------------------------------------
> >
> > This patch fix this issue and make cinematicexperience can run on qt5.3.
> >
> > ref:
> http://wickwire2099.blogspot.tw/2014/05/qt-530-qt5-cinematic-experience.html
> >
> > Signed-off-by: coldnew <coldnew.tw@gmail.com>
>
> Can you please use full name?
>

 Ok, I'll resend this patch

