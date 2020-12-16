Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.58])
 by mx.groups.io with SMTP id smtpd.web10.1863.1608087524418107808
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Dec 2020 18:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EPtwB/v/;
 spf=pass (domain: windriver.com, ip: 40.107.220.58, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j518b9XJuOnk1MDjvJ/S7quqEJFTeU7os7iAlLJ3jqHJhqaF35Htn5MY3aBNxT3dxnUL0ZcHy3UAXkzxrW2Kntsrvin5C3LfBmkFRDHNAgwoKctc1gIDKro6w9WZLP0Km9m/F4NlG7/FkjVtg1XmX46Kg6VMmBqDzIUVEcavUZxciCDOlPN9+8wEfRCCYcLBs4MrzLBmUH13kLQW9IG00zCoZf/D0s64zEv9EOAuMODRO3WoOUmGF3CIMLC7Fgf8QpmuxpiSC7BVguHZF4WUhEjAxfNuhPsuBkPrtoN6460LvLM1hNVlVT1hNICopQIUTPg/7hS7Fs4Sbi/5jIQ07w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jg8AGDJLWndUJuoLqkmGu0/gYDlIJZs5w9nKAwXjpk=;
 b=exA3IuYiCrfe4wMZdseR4XY1CRCr/uh4L+206TMxI+h2ExFvQCy8JWs6ayAZWR/VrdtYUb3c49T4nIxUdRxfCui+Zqxs/9SP/WoFdBZ2PFuyuYFMrkxaRKXHaVBX+OJi3Jpn3FfaNM+hOOSoYxHLsz3JUzSSf2KLNxDl4RXEjbSg1rLhy8crWX5dg4/1bFHcwXW07dY6iGaYPGjvhBt2Ot4Z42Unr7hTXnRQUqNxadNBzBf+YDg4tk49gTSxvRjmqO8CzcTzF9CGo+dvVrnPsTKFp4ij81gMvL02ZvWxuXQxK+QeIqpTr6wnc5okxgkN1kEQBMuoZspd41Zk6lMN0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jg8AGDJLWndUJuoLqkmGu0/gYDlIJZs5w9nKAwXjpk=;
 b=EPtwB/v/qqe5goX5h+Lkq7OebHqauVz14YjZCmfcxdq9kBElNOKuvjrrhrDzDhcqeedK1GHR9UCvqgbTDimgawCKeruC394ULMkwnyDMbYRAr45gSGzz8/C1YZaqwtUt02/3/EFLbhJqsfNIuQN8EIfIohy9+0LHM/FjbCYqT2E=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SA2PR11MB5130.namprd11.prod.outlook.com (2603:10b6:806:11d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.21; Wed, 16 Dec
 2020 02:58:42 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4%6]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 02:58:41 +0000
Subject: Re: Fail to start gdm
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <5674ee97-bd13-1bae-a3f3-83c1c403f20f@windriver.com>
 <CALbNGRRrDCExT9PmioSoL=sv+q3yRL+Lz6joW6FH_tp1QaR8Lw@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <0943e687-d58f-d49b-dfed-61c460cfccce@windriver.com>
Date: Wed, 16 Dec 2020 10:58:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CALbNGRRrDCExT9PmioSoL=sv+q3yRL+Lz6joW6FH_tp1QaR8Lw@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::11) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.142] (60.247.85.82) by SJ0PR03CA0036.namprd03.prod.outlook.com (2603:10b6:a03:33e::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 02:58:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 062c64b6-469b-4110-542c-08d8a16e7edd
X-MS-TrafficTypeDiagnostic: SA2PR11MB5130:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB51301AD644A0492F69AF4F0195C50@SA2PR11MB5130.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IaqkufPw1LZmUxg7oGKoZryxDImMejEJN4YdJ2L4D6QYcV+zlNWrBvZx/u9hJ1r6dTEqcP5YbHjtrndgmtqn5hqI5y55eMMHUn+2fEFyUImzadirk3E9H6galP/oXCJVHp+84c/kCfVN59V0pyE0SG+6mEfpF/rhWIo7LI+PiS4A5A33CMxo+v8dfj7iSWPakX8cCq+Gpr+qYwrfjaxAF8/npiHeVqaLau/xEBM2WP+BqcJcW6g1W8xfrxx/uvdpNxCnkso6orDayWdSuzc9FdiDd8meYvmQtD15hQdZWx+VTTYZvIMHklQe/+44qInP3dlazpayNR226lB+lJr/lh9vEtkQnb1bitN5C4JrJNcYo10LCDTa9RhGzmJ27GzsZqWSu+ICpfAkfJ5cXt4YxMx9WNkk5/A+z20scLiKtWHxKUToUL1P0LqbPISOd1tS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(376002)(346002)(366004)(396003)(136003)(6916009)(3480700007)(26005)(478600001)(52116002)(6666004)(2616005)(186003)(6706004)(31696002)(956004)(16526019)(6486002)(8936002)(2906002)(53546011)(4326008)(66476007)(83380400001)(5660300002)(86362001)(31686004)(66556008)(316002)(16576012)(66946007)(36756003)(66574015)(8676002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?FSOylZo6La4j8S6opyC8iIp+r8QNesHSwYwm648Az2ZWZJf+hOFuqyqcjdTU?=
 =?us-ascii?Q?/p5Rc9diUp6XAndbaT6PDv0QBEQXKftG6PYTW36lKf0Cb0c0neDGaziLY8uN?=
 =?us-ascii?Q?Xt0JxFhOvAWT4aXznnDxaQuJMsG49x0acuzpiyBBlYgwDdsgmJHPshlJpTMN?=
 =?us-ascii?Q?EW+R/+xF04MbodYDA9PfVNaGgFl8ma2M9pehmDnrFRzJfOytU9G9V6AqYIyF?=
 =?us-ascii?Q?SzHxxG09gJf6+D68aweL3D00k7cY/L/+LQY/ldGSo+Z/TOsuN1FDCIfu3Uvv?=
 =?us-ascii?Q?kNzIrzxhXO/TFvDqnkilyM2W2WFtAibPOHvavpaqK1yVOtt76JyDtOlN95pp?=
 =?us-ascii?Q?eQPEAC1fqdLS3zrwqblQAxAsKac3HGejj4FlJOrKxsWiWI6imUPEc9EdVsOg?=
 =?us-ascii?Q?TYZC8+EFx2zCF6kRgd3g7uCk35HfIrrs10C8oOudAuFIDKsRM81zsUb9FUEW?=
 =?us-ascii?Q?OZCBLZj4phrVhhUiMsSgGBbqwHGYaByWsTdMNPaV5svXf2m+/2j0FkaHl4Dd?=
 =?us-ascii?Q?eLhVxbCA7CPxWEluLtxg7sKFjCTSMW0Ywed/cZ99t7NszdltENDWqtSbWGcc?=
 =?us-ascii?Q?fdH3kK/Pb8F+nRtsfDVvePE4J/GmkC9kL2DaugYJui1OFyyF4eNB1ZXo5fgA?=
 =?us-ascii?Q?yEi8OGQqtFa9hpGM4E1aDW2W7y3e+qvZFMXkTH098eR8dq8DBBZkhzrheVe0?=
 =?us-ascii?Q?JXE/rUpvGjdO00eTlNqcREj3xuwxrnqUJ1JgtrDs2ePU26SowfybOHFl5EpS?=
 =?us-ascii?Q?FjSedXSIkFHu7lHCPVP0vL+Sr2dOm/qcAPEL5nfO+tqwOdL6qNyV+q3SajSq?=
 =?us-ascii?Q?FyMUil1T3TUN2vLVHQO5Yqxetwek2SDAVggU7SIQG+AEc3zU/VEQQ5u4jGN9?=
 =?us-ascii?Q?Hd/5l+068Mrh8e2CkhzezJbGfSZ4pXxhwzvj9bCZCzJz02s4QN4wfSPM9Tjv?=
 =?us-ascii?Q?w9h8TE+u5txShczdHp89yZOcV8pzimgiLeeIk2lAfewQD9+9G2v6+uXlHJJD?=
 =?us-ascii?Q?ssRq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 02:58:41.7535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 062c64b6-469b-4110-542c-08d8a16e7edd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+5Hx/jjiTrpYIZ0x+HeZMTorr087ePgKFH7r8uS6vYagyrd34LXEobqhzTCK+Qse2kGmF4CuvXlOVDtgId4IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5130
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 12/15/20 2:15 PM, Andreas M=C3=BCller wrote:
> On Tue, Dec 15, 2020 at 3:58 AM Kai <kai.kang@windriver.com> wrote:
>> Hi Andreas,
>>
>> I am trying to use gdm as graphical_init_manager. But it fails to start
>> gdm with core-image-minimal-xfce.
>>
>> My config in local.conf:
>>
>> IMAGE_INSTALL_append =3D ' gdm rsyslog'
>> VIRTUAL-RUNTIME_graphical_init_manager =3D "gdm"
>> DISTRO_FEATURES_append =3D ' pam polkit'
>>
>> #
>> # Use systemd for system initialization
>> #
>> DISTRO_FEATURES_append =3D " systemd"
>> DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
>> VIRTUAL-RUNTIME_login_manager =3D "shadow-base"
>> VIRTUAL-RUNTIME_init_manager =3D "systemd"
>> VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
>>
>>
>> When I boot the image and run gdm, it shows error:
>>
>> gdm-x-session: X server did not write display string
>>
>> I have tried to enable configure option '--enable-suid-wrapper' of
>> xserver-xorg, it fails with other error looks like:
>>
>> GdmManager: uid for sender and uid for session don't match
>>
>>
>> Did you meet such error when you upgraded gdm, please? And what's you
>> config when you validate it?
>>
>> Thanks a lot.
>>
>> Kai
>>
> Hi Kai,
>
> Ooh - haven't tried this for very long time - am using sddm. When I
> last tested it It looked to me that using gdm with something else but
> gnome is pain.
>
> As you might have seen my recent Yocto activities were few - am in
> release panic on the job.
>
> Plan to do some work on meta-gnome and meta-xfce during x-mas so will
> look into that then.

Thanks for you quick reply.

I tried with core-image-minimal + packagegroup-gnome-desktop, it fails=20
with another issue which I've met but not fixed yet:

 > gdm: GdmManager: uid for sender and uid for session don't match

It parses /run/systemd/sessions/cx to get session uid but it is always=20
0/root but expect user gdm.

Regards,
Kai


>
> Cheers,
>
> Andreas


