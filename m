Return-Path: <ken.s@variscite.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73399C77B7F
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 15:54:23 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.86])
 by mx.groups.io with SMTP id smtpd.web11.28515.1683906852756665420
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 May 2023 08:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@variscite.com header.s=selector2 header.b=mbMk+K3J;
 spf=pass (domain: variscite.com, ip: 40.107.241.86, mailfrom: ken.s@variscite.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYJ+QXnd2Qj31/lDvUr0z4u5r6IS73oaCtK9/Q3LMqQYJqHxTlSrH/M3+RZ/ea/UTotl5b6rJNvHqI1UwFzhPwV30tIrtmpq4pV5kj0DX3E2nUAXlrPxNT/R0yMZ+o2V0Py29yES0gZprEFXO0M0gg9OFBSYZCx7p8i0qTAQ+/ml0ZsUv6wlZRJjA9Hw0TtaDVaqzt2FC7gb/BS5jY55fX5x3AdRoA9IZZE6GHrcg2OGbDnN72apxa/mkOjgBkw5B76yRREF4m/L6WvuKCUPvBxSPe2bAilpABLhEmR04cISaUIdszgzMoHBCaD1LfY2uyi/JDwU9yBG7brmUskaAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCiplSeAbN0zwiPqEBUzPzwr31H0PCXNtq1rtaferrs=;
 b=RJnZHp05VF2MdUWtxDQDkkcY9OO1qdYeqguSf8HdLkvk4ORupIEm42yFU+CKThV7yQDLg1MOUV7TOZAQoG76BbcQtuujfF3SPjNUAMzNcTVAbCg08vS5G1qnBZlPjPD2nFYu5qt45M7S5safcEb+NEhw6C/25R5KoVbx2HwgPV8eRakQghqYI47HO2hOTKxEuXz4ZYuDz8T2I7AMHZWI7J2KYupTHzA9j0i3FS9vHokD5HGVStVqew3jF9s1H0/WreokD8uirUutXyGntMo5T4CmNcxjq//Wh9fEs7yCKa7nrjCDQpemTKMOiHC4qgQlXpgkTXpDrYTFa0l7dVMFvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCiplSeAbN0zwiPqEBUzPzwr31H0PCXNtq1rtaferrs=;
 b=mbMk+K3JzkTfHmvZ9bhMX2mFAmZaz+yijg+xnvxvYctYxVdBESOXpzLbOWhelpZWc2Xo4QzVt2Ng8nCtwHBqWGZ4uXEmx/DjyQpfxqSvntQVbauUwg55QXtQQgr0XDP28POysCOMC+jE/kv3Qh//rFT7zu82rfcKue2r/YTeMmi6ZQHeidErQPPKiKcJWJnryUFPLy23Tgh8ay8xiMUb/xGXraLIRwYbBcoRpoAyNb85u1fjbAiQpLyaTev/A5WrNS1jAZmdXgtqvaDYf1+OTf0fGZxbHksxppGzLqyz0lAnTgExQyuX+4ToEaah+aiRMoRiHAR0XGvUhMiLJAmlCg==
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB6633.eurprd08.prod.outlook.com (2603:10a6:10:23d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Fri, 12 May
 2023 15:54:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%3]) with mapi id 15.20.6387.023; Fri, 12 May 2023
 15:54:08 +0000
From: Ken Sloat <ken.s@variscite.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "raj.khem@gmail.com" <raj.khem@gmail.com>, "adrian.freihofer@gmail.com"
	<adrian.freihofer@gmail.com>, Nate Drude <Nate.D@variscite.com>, Eran
 Matityahu <eran.m@variscite.com>, Ken Sloat <ken.s@variscite.com>
Subject: bug: meta-networking: networkmanager: Langdale: duplicate
 NetworkManager services at runtime
Thread-Topic: bug: meta-networking: networkmanager: Langdale: duplicate
 NetworkManager services at runtime
Thread-Index: AQHZhMscK6KOUeWiXE6MKQp9bqCQaw==
Date: Fri, 12 May 2023 15:54:08 +0000
Message-ID: 
 <AS8PR08MB79917BE073AD8B9C2DF54529EC759@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|DB9PR08MB6633:EE_
x-ms-office365-filtering-correlation-id: bab81fc4-2aec-4e03-dbaa-08db53011f41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ss33nuEOkmgoySZmup2IZztipCg3mq71Bafds9+b8nIkbaKeb9CyKfWC9lX2zIVaPt8uE1fO5W55iF30PREWZLqzS2mDqFNmtEh/Okw1JOvTZQGRAJ8ZpXLsQJhUWivelBQoXBLrMZn9tWWHtOVz3BY+kaaUucYnoV1+kYiPAQ8ZqjyK7H9HVK5bEgdGWBZOlPNr74ZIkw/onuBamYY/YLGJguLif3tzI3UFp30bqVMan58uONKHq31glAVJSU7xQPw888gzjyu/mVt7NY56bavZIuIzwqZlTDbRH00iA+QL6hCOLpSo8foe5qMIvmTcKWRJMLsL/oxOTh06ThFG0+p5enoow2kO6YQadikYUX8uvOP6t260CpSIm04Fek9jshLnqsqmehnIJ9zk7ggLRZ2IwjldObLdKEc6pAbLIGrJEtVF80wJrcPvMkXoLVdvPffYjVXNOaOEuCJTFGqwEt8kh+j6ZqjPkk74pmVVsPLxj4cjEMn9xnfpBxjArheAFYwIi2+IbNMGvC1dHp4kbcU4nj6J5U5F5p96Q+4y3gdU8WWSvszyLVMq6q9c3qw0rUjpruMTx4B1AX0Ir121Ayc4bVw5428YLF16D6qH1eI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39840400004)(396003)(136003)(366004)(376002)(451199021)(2906002)(54906003)(66556008)(107886003)(7696005)(83380400001)(64756008)(66476007)(66946007)(66446008)(966005)(478600001)(76116006)(52536014)(4326008)(26005)(186003)(8676002)(55016003)(9686003)(8936002)(6506007)(5660300002)(6916009)(71200400001)(41300700001)(316002)(38100700002)(38070700005)(86362001)(33656002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?tQjzzXQ3U/qf1WShFMBd6Nyl/v8qRRkh7++l7vHkSK88XqPzN2fjtbJa1J?=
 =?iso-8859-1?Q?+Tn0vuWRU7UOy9/lcOPHtHHV8u8HO7T/m12TOhGKR4E6/2udFq7hgCBX5B?=
 =?iso-8859-1?Q?e2F5pxEK/0Qw2mSrADD8bMRb+ZcHz6dcyYLGSw/WEa7NsqF61y7WtmMvo0?=
 =?iso-8859-1?Q?WNBfjUKSsyFG8nfeAdvdDNwr+FR8FNLl6atzxoiiZDiDo7af6JUXw5GulM?=
 =?iso-8859-1?Q?2h4Sv6sPXoZ4cGlVrR2LUPhr6cRQd214AZTkzzW7TEvWwnWW3GYOAOTghR?=
 =?iso-8859-1?Q?LGSIRsR/KB9Qtv8yeKRw/4lD/HkWM9Hi3lRzMSyTe/zQ9oVW4nIRFQm0nu?=
 =?iso-8859-1?Q?h0FNGEv7g/qHfyTzGJQJd5HMFsuxdrCPVZz6pmE0QswyEBxKqiT6qjx//0?=
 =?iso-8859-1?Q?tRKBuLlzEh6mUIx7ScQT28njJBduMugGbk/Mk7GgtEKO9bTTgIeSvytU9i?=
 =?iso-8859-1?Q?FIUoxuDXlyXMHz81shHAJREAm7pCDzKcJAakrBMpRMTsMvtsTZ3dn0sYs/?=
 =?iso-8859-1?Q?0pbChntKPoEzJehwY8NhOOgHlqHh5ys/vqmP8KXRFxH0cKJPYUh14AIrgU?=
 =?iso-8859-1?Q?ZZ6DPTEDb3+VlfYDt4c3dglxjnCRaN6bKqCp+C66mhnGcIqmeME5yAqasO?=
 =?iso-8859-1?Q?LJfD+VYUX3mqhPdu3xLvNElcHZNwtEwL36RoM4mB4sZHu2czbOvPzoNIFg?=
 =?iso-8859-1?Q?LdO4tjojorGrojkc5Ukt5KQppPaQVo9Jgj11ItPKWHH0QSdSbpmZ7L2JKJ?=
 =?iso-8859-1?Q?arVevH8GUGEwbvJLg8fTbO2cNWG19TjR1zzMrr1nRXmb4WMmMem1pAu/i2?=
 =?iso-8859-1?Q?T/A4iy0i/cuwmC4jDTjLtu7FWcP0MuXz/S2EGMh/rgBcpUf4No831fNX0A?=
 =?iso-8859-1?Q?iRfbCKIPMZh9R9TJaD4xGbEAClD+/u+PqBCtvUxriNaXk0Nbh682XEfr+D?=
 =?iso-8859-1?Q?MM8jUVhWfHQYUXOTkj37paz0PL/F8RbRIvmOovv0F9XilsPUCN/cgyJN3O?=
 =?iso-8859-1?Q?J2Lp97wvJuQi3D4R0Muw9JZjQDbaSOwXLHDASKWVpsQI5+5oOpJlRWXVxA?=
 =?iso-8859-1?Q?GduzmmTWGscOomhDwFn1TcfrNOl/K/kuKqdo1q/u0wyCR34S+1dr+4469F?=
 =?iso-8859-1?Q?TGNBiSWH+n3QkT4w8XZDDmGtYufOU9hZjI1524DB55Nh14KXJlJ00zaUgV?=
 =?iso-8859-1?Q?G6YfWF9QeuqxDeQ0c6MIY7uwCMxt3Y/zZnej6o+zWUHDChWuXpnG9IP67a?=
 =?iso-8859-1?Q?Qg9n5IwaWewwfO69cF1HftKK5snTnpS64URdrW6916dDXIpkfC8Lh9d4pj?=
 =?iso-8859-1?Q?ODc+0qEENeG4QzBhAk3XnLkfNUqFV/ieHoWfcB15DNaIt6UD8ygDuMOdhb?=
 =?iso-8859-1?Q?fA6so61ICJhDCGnhHBLUlBN98KNqWlpO0+LYGBbBZyeNKU455w96N6lrnb?=
 =?iso-8859-1?Q?pXAJwfmBp6qKsIv1kEqoNZi3vc3mqNoWqo8jD6gANJNtL1BGkYY8PfER3Q?=
 =?iso-8859-1?Q?r43I4JSOn5JuWhMUqUbfy84XJLjX3owC6PEaEfRCPKRyCzQeDInNdeQy+C?=
 =?iso-8859-1?Q?S1LChrdM4Y2R9bg0ShFchqW5SBBWMEThp2x7XN/OOlTFELh09jBauS1Ry+?=
 =?iso-8859-1?Q?+V3gmhTShUy90=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5294312196128B4F9D3E0AA17F38AE78@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bab81fc4-2aec-4e03-dbaa-08db53011f41
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2023 15:54:08.7371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5eGGp6RO+CD0oqdVjMxx33FE8ZaiiNa883mpuWbBrFkm/gtuJiO6cSSGTpTHFFCOGh9Glk5A9aiOAtfKVXIgEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6633
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 May 2023 15:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102557

Hello,

I believe I have found a bug in meta-networking: networkmanager in Langdale=
 when upgrading from Kirkstone. It appears that this recent change:

https://git.openembedded.org/meta-openembedded/commit/?id=3D009bc195629ac4e=
885d7ae5148a175c8c8147e8f

restructured the recipe and packages for networkmanager. As part of that ch=
ange, it started explicitly packaging the sysvinit network-manager script, =
which had previously been omitted:

-FILES:${PN} +=3D " \
-    ${libexecdir} \
+SUMMARY:${PN}-daemon +=3D "The NetworkManager daemon"
+FILES:${PN}-daemon +=3D " \
+    ${bindir}/nm-online \
+    ${datadir}/dbus-1 \
+    ${datadir}/polkit-1 \
     ${libdir}/NetworkManager \
-    ${nonarch_libdir}/firewalld/zones \
+    ${libexecdir} \
+    ${localstatedir}/lib/NetworkManager \
+    ${NETWORKMANAGER_DISPATCHERDIR} \
+    ${nonarch_base_libdir}/udev/* \
+    ${nonarch_libdir}/firewalld \
     ${nonarch_libdir}/NetworkManager/conf.d \
-    ${nonarch_libdir}/NetworkManager/dispatcher.d \
     ${nonarch_libdir}/NetworkManager/dispatcher.d/pre-down.d \
     ${nonarch_libdir}/NetworkManager/dispatcher.d/pre-up.d \
     ${nonarch_libdir}/NetworkManager/dispatcher.d/no-wait.d \
-    ${nonarch_libdir}/NetworkManager/VPN \
     ${nonarch_libdir}/NetworkManager/system-connections \
-    ${datadir}/polkit-1 \
-    ${datadir}/dbus-1 \
-    ${nonarch_base_libdir}/udev/* \=20
+    ${nonarch_libdir}/NetworkManager/VPN \
+    ${sbindir}/NetworkManager \
+    ${sysconfdir}/init.d/network-manager \ <------------------------------=
----- here
+    ${sysconfdir}/NetworkManager \
     ${systemd_system_unitdir} \
 "
+    ${sysconfdir}/init.d/network-manager \
+    ${sysconfdir}/NetworkManager \

In configurations running systemd, this results in a NetworkManager.service=
 systemd unit and a network-manager sysvinit script. Since these units have=
 different name strings, when using systemd, systemd-sysv-generator thinks =
that "network-manager" is missing a .service file and will generate a late =
file at boot time:

[ =A0 =A02.003126] systemd-sysv-generator[141]: SysV service '/etc/init.d/n=
etwork-manager' lacks a native systemd unit file. Automatically generating =
a unit file for compatibility=A0 .....

This results in a conflict; it means there will be two services for Network=
Manager and one of them will succeed and the other fail. Who wins seems to =
vary based on build configuration since this is likely just a race conditio=
n:

[FAILED] Failed to start Network Manager.
See 'systemctl status NetworkManager.service' for details.

root@qemux86-64:~# journalctl -u NetworkManager
May 12 12:06:47 qemux86-64 systemd[1]: Starting Network Manager...
May 12 12:06:48 qemux86-64 NetworkManager[210]: <info> =A0[1683893208.1727]=
 NetworkManager (version 1.40.0) is starting... (boot:7d16287e-3a0a-40c6-b9=
4c-6dd6d069fe3c)
May 12 12:06:48 qemux86-64 NetworkManager[210]: <info> =A0[1683893208.1739]=
 Read config: /etc/NetworkManager/NetworkManager.conf
May 12 12:06:48 qemux86-64 systemd[1]: Started Network Manager.
May 12 12:06:48 qemux86-64 NetworkManager[210]: <error> [1683893208.2285] b=
us-manager: fatal failure to acquire D-Bus service "org.freedesktop.Network=
Manager" (3). Service already taken
May 12 12:06:48 qemux86-64 NetworkManager[210]: <info> =A0[1683893208.2292]=
 exiting (error)
May 12 12:06:48 qemux86-64 systemd[1]: NetworkManager.service: Main process=
 exited, code=3Dexited, status=3D1/FAILURE
May 12 12:06:48 qemux86-64 systemd[1]: NetworkManager.service: Failed with =
result 'exit-code'.
May 12 12:06:48 qemux86-64 systemd[1]: NetworkManager.service: Scheduled re=
start job, restart counter is at 1.
May 12 12:06:48 qemux86-64 systemd[1]: Stopped Network Manager.
May 12 12:06:48 qemux86-64 systemd[1]: Starting Network Manager...
May 12 12:06:48 qemux86-64 NetworkManager[227]: NetworkManager is already r=
unning (pid 216)


root@qemux86-64:~# systemctl status NetworkManager
x NetworkManager.service - Network Manager
=A0 =A0 =A0Loaded: loaded (/lib/systemd/system/NetworkManager.service; enab=
led; preset: enabled)
=A0 =A0 =A0Active: failed (Result: exit-code) since Fri 2023-05-12 12:06:50=
 UTC; 2h 20min ago
=A0 =A0Duration: 26ms
=A0 =A0 =A0 =A0Docs: man:NetworkManager(8)
=A0 =A0 Process: 236 ExecStart=3D/usr/sbin/NetworkManager --no-daemon (code=
=3Dexited, status=3D1/FAILURE)
...

root@qemux86-64:~# systemctl status network-manager
* network-manager.service - LSB: network connection manager
=A0 =A0 =A0Loaded: loaded (/etc/init.d/network-manager; generated)
=A0 =A0 =A0Active: active (running) since Fri 2023-05-12 12:06:48 UTC; 2h 2=
0min ago
=A0 =A0 =A0 =A0Docs: man:systemd-sysv-generator(8)
=A0 =A0 Process: 211 ExecStart=3D/etc/init.d/network-manager start (code=3D=
exited, status=3D0/SUCCESS)


I initially observed this on our custom Arm based NXP platform, but as you =
can see from my logs above this is reproducible on qemux86-64 by enabling n=
etworkmanager and systemd.

I would like to submit a patch, but want to discuss the right approach. We =
could install the sysvscript as NetworkManager, but this could make for use=
r backward-compatibility problems. Another solution is to make a symlink na=
med "network-manager.service" in ${systemd_system_unitdir} as this simply a=
liases the real service. Perhaps there is another better solution...

Thanks

Sincerely,
Ken Sloat


