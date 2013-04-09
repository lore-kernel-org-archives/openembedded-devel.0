Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1UPX70-00087t-N6
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 13:53:20 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.279.5; Tue, 9 Apr 2013
	13:35:58 +0200
X-TM-IMSS-Message-ID: <63e39a520004bb1e@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 63e39a520004bb1e ;
	Tue, 9 Apr 2013 13:36:01 +0200
Message-ID: <5163FD1E.40500@nedap.com>
Date: Tue, 9 Apr 2013 13:35:58 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: sysvinit?
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
X-List-Received-Date: Tue, 09 Apr 2013 11:53:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

I was wondering what the status is for sysvinit.
Is it maintained or not?
If I want to use it in my image how should it look like?
Something like this?

    inherit core-image

    IMAGE_LOGIN_MANAGER = "tinylogin shadow"
    IMAGE_DEV_MANAGER = "busybox-mdev"
    IMAGE_INIT_MANAGER = "sysvinit sysvinit-pidof"
    IMAGE_INITSCRIPTS = "initscripts"

    export IMAGE_BASENAME = "${PN}"

    IMAGE_FEATURES += " \
         package-management \
         debug-tweaks \
         "

    IMAGE_INSTALL += " \
         ${IMAGE_LOGIN_MANAGER} \
         ${IMAGE_DEV_MANAGER} \
         ${IMAGE_INIT_MANAGER} \
         ${IMAGE_INITSCRIPTS} \
         "

Should I add more?

Jaap

