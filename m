Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4675B6D23F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2013 21:04:47 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id i4so1494341oah.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2013 14:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=n/6oFV25tuuoY0b2L2M9jV00dKwUt0RZ+PzoQLRYluk=;
	b=W3CEEazjO8hhlVrKkhQ98VJ+i/ViiBlfJIxMvO4Iwe+e5v4Y1/yevFYAx68qgamfch
	RqBVTJz8rReqFHlkFkhtFbNuhhzhxanYfPkHucQv0EfFcQRAdzfcGi5DbAEo0a7Z21tG
	wXecYu9EIlumfTa+K2+vEpVtDwIa09LpUrPoiFwHoSdkr+CL58QtKffhhc2zjZLy5bJu
	8m3/eBakFvh5p3e5oMvRGsZk1x/Fr5kaWlzfkJag2wIqEeqIa2OuvVNeTP4cxtKjc9ic
	KJCNgA58dHTPsJ73tQH70Q46kQ3w19EW9aDxryq77TN0FQkmFOYJvEcVe63BjvjU4DnL
	Jm2Q==
X-Gm-Message-State: ALoCoQmhqiI5Dp73IYwaVgvaKrSLoW0YLuVTv6GtME1F5ZI+04Xk2h/fOa+i/5hfVy41tSu9CXhM
X-Received: by 10.60.40.166 with SMTP id y6mr2985420oek.92.1382562288593; Wed,
	23 Oct 2013 14:04:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.156.40 with HTTP; Wed, 23 Oct 2013 14:04:27 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 23 Oct 2013 23:04:27 +0200
Message-ID: <CAP71WjzaQ__sPGsNxEG04yfPgnW+ZdGMN1HMSZzOje5SKhWXVw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: differences between target and native configure options
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
X-List-Received-Date: Wed, 23 Oct 2013 21:04:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi,

i have a recipe that is both used for target and for native. I need to
have different configure options when it's built for target as opposed
to native.

earlier today on IRC, ericben showed me

EXTRA_OEMAKE_virtclass-native = "what you want"

However i now realize i need the exact opposite, i need to specify an
option only when building the 'target', not native.

iirc, virtclass is for native, or multilib... so is there another
mechanism to do what i need?

thanks

nicolas

