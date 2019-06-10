Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 853987E393
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2019 02:12:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5A2Cj97028664
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 9 Jun 2019 19:12:45 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 9 Jun 2019 19:12:44 -0700
To: akuster808 <akuster808@gmail.com>, <raj.khem@gmail.com>
References: <20190531084423.172617-1-kai.kang@windriver.com>
	<974dea6a-ad6c-3c82-5fa7-b36f1368d3f7@gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <e3918833-0400-e0ab-148a-fb7214e8b94d@windriver.com>
Date: Mon, 10 Jun 2019 10:10:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <974dea6a-ad6c-3c82-5fa7-b36f1368d3f7@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][PATCH 00/10] Update recipes in meta-xfce
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jun 2019 02:12:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/6/3 上午4:23, akuster808 wrote:
>
> On 5/31/19 1:44 AM, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>>
>> Kai Kang (10):
>>    thunar: 1.8.4 -> 1.8.6
>>    xfdesktop: 4.13.3 -> 4.13.4
>>    xfce4-panel: 4.13.4 -> 4.13.5
>>    thunar-volman: 0.9.1 -> 0.9.2
>>    xfce4-appfinder: 4.13.2 -> 4.13.3
>>    libxfce4util: 4.13.2 -> 4.13.3
>>    xfwm4: 4.13.1 -> 4.13.2
>>    xfconf: 4.13.6 -> 4.13.7
>>    libxfce4ui: 4.13.4 -> 4.13.5
>>    xfce4-power-manager: 1.6.1 -> 1.6.2
> Are these bug fix only updates for possible Warrior backport?

Most of they are not only bug fix updates, but also updates for next 
xfce release 4.14 except:

1. thunar-volman: only i18n updates
2. libxfce4util: bug fix and i18n updates

Regards,
Kai


>
> - armin
>>   .../{libxfce4ui_4.13.4.bb => libxfce4ui_4.13.5.bb}          | 4 ++--
>>   .../{libxfce4util_4.13.2.bb => libxfce4util_4.13.3.bb}      | 4 ++--
>>   .../{thunar-volman_0.9.1.bb => thunar-volman_0.9.2.bb}      | 4 ++--
>>   .../thunar/{thunar_1.8.4.bb => thunar_1.8.6.bb}             | 4 ++--
>>   ...{xfce4-appfinder_4.13.2.bb => xfce4-appfinder_4.13.3.bb} | 4 ++--
>>   .../{xfce4-panel_4.13.4.bb => xfce4-panel_4.13.5.bb}        | 4 ++--
>>   ...-power-manager_1.6.1.bb => xfce4-power-manager_1.6.2.bb} | 6 +++---
>>   .../xfconf/{xfconf_4.13.6.bb => xfconf_4.13.7.bb}           | 4 ++--
>>   .../xfdesktop/{xfdesktop_4.13.3.bb => xfdesktop_4.13.4.bb}  | 4 ++--
>>   .../recipes-xfce/xfwm4/{xfwm4_4.13.1.bb => xfwm4_4.13.2.bb} | 4 ++--
>>   10 files changed, 21 insertions(+), 21 deletions(-)
>>   rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.13.4.bb => libxfce4ui_4.13.5.bb} (89%)
>>   rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.13.2.bb => libxfce4util_4.13.3.bb} (64%)
>>   rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.9.1.bb => thunar-volman_0.9.2.bb} (76%)
>>   rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.4.bb => thunar_1.8.6.bb} (86%)
>>   rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.13.2.bb => xfce4-appfinder_4.13.3.bb} (69%)
>>   rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.13.4.bb => xfce4-panel_4.13.5.bb} (90%)
>>   rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.6.1.bb => xfce4-power-manager_1.6.2.bb} (88%)
>>   rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.13.6.bb => xfconf_4.13.7.bb} (82%)
>>   rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.13.3.bb => xfdesktop_4.13.4.bb} (76%)
>>   rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.13.1.bb => xfwm4_4.13.2.bb} (89%)
>>
>

-- 
Kai Kang


